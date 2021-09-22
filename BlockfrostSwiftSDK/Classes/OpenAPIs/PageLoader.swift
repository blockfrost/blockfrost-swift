//
// Created by Dusan Klinec on 16.09.2021.
//

import Foundation
import Combine

public typealias PageLoader = DispatchPageLoader

open class PageLoaderCancelled : Error {
}

open class PageLoaderError : Error, CustomStringConvertible {
    var page: Int
    var error: Error

    public init(page: Int, error: Error) {
        self.page = page
        self.error = error
    }

    public var description: String {
        "PageLoaderError(page: \(page), error: \(error))"
    }
}

/**
 * Page loader using only basic Swift constructs.
 */
open class DispatchPageLoader<T> {
    public enum LoaderEvent {
        case started
        case pageLoaded(page: (Int, [T]))
        case completed(data: [T])
    }
    
    public typealias LoaderResult = Swift.Result<[T], Error>
    public typealias LoaderCompletion = (_ result: LoaderResult) -> Void
    public typealias FutureType = Future<(Int, [T]), PageLoaderError>
    public typealias LoaderType = (_ count: Int, _ page: Int, _ completion: @escaping LoaderCompletion) -> Void
    public typealias ProgressHandlerType = (_ event: LoaderEvent) -> Void

    public var batchSize = BlockfrostConfig.DEFAULT_BATCH_SIZE
    public var loadCount = BlockfrostConfig.DEFAULT_COUNT
    public var maxPage: Int? = nil
    public var progressHandler: ProgressHandlerType? = nil

    var page = 1
    var terminate = false
    var isCancelled = false

    var acc: [T] = []
    var subResults: [(Int, LoaderResult?)] = []
    var error: Error? = nil

    var numPages = Atomic<Int>(0)
    var loader: LoaderType? = nil
    var completion: ((_ result: LoaderResult) -> Void)? = nil

    let queue = OperationQueue()
    var group = DispatchGroup()

    public init(batchSize: Int? = nil, loadCount: Int? = nil, maxPage: Int? = nil, progressHandler: ProgressHandlerType? = nil) {
        if let x = batchSize { self.batchSize = x }
        if let x = loadCount { self.loadCount = x }
        if let x = maxPage { self.maxPage = x }
        self.progressHandler = progressHandler
    }

    open func cancel() {
        isCancelled = true
        queue.cancelAllOperations()
        completion?(.failure(PageLoaderCancelled()))
    }
    
    open func stop() {
        terminate = true
    }

    open func getNumPages() -> Int {
        numPages.get()
    }

    fileprivate func feedQueue() {
        if terminate {
            return 
        }
        
        (0 ..< batchSize).forEach { i in
            let cpage = page + i
            group.enter()
            queue.addOperation {
                self.loader?(self.loadCount, cpage) { lres in
                    self.subResults[i] = (cpage, lres)
                    self.group.leave()
                }
            }
        }
        
        page += batchSize
        group.notify(queue: .global()) {
            self.queue.addBarrierBlock {
                self.subResults.enumerated().forEach { ix, el in
                    if self.terminate {
                        return
                    }

                    guard let lres = el.1 else {
                        return
                    }
                    
                    switch(lres){
                    case let .failure(err):
                        self.error = err
                        self.terminate = true
                        self.completion?(.failure(PageLoaderError(page: el.0, error: err)))
                        break
                    case let .success(res):
                        self.acc.append(contentsOf: res)
                        self.progressHandler?(.pageLoaded(page: (el.0, res)))
                        
                        if res.isEmpty == true {
                            self.terminate = true
                            return
                        } else {
                            self.numPages.mutate { $0 += 1 }
                        }
                        break
                    }
                }

                let cMaxPage = self.maxPage
                if !self.isCancelled && !self.terminate && (cMaxPage == nil || self.page < cMaxPage!) {
                    self.feedQueue()
                } else if self.error == nil {
                    self.progressHandler?(.completed(data: self.acc))
                    self.completion?(.success(self.acc))
                }
            }
        }
    }

    open func loadAll(_ loader: @escaping (_ count: Int, _ page: Int, _ completion: @escaping LoaderCompletion) -> Void,
                      completion: @escaping (_ result: LoaderResult) -> Void) -> Void
    {
        page = 1
        numPages.set(0)
        terminate = false
        isCancelled = false
        acc.removeAll()
        subResults = Array(repeating: (0, nil), count: batchSize)
        self.loader = loader
        self.completion = completion

        group = DispatchGroup()
        queue.cancelAllOperations()
        queue.maxConcurrentOperationCount = batchSize
        progressHandler?(.started)
        feedQueue()
    }
}

/**
 * PageLoader based on Combine framework
 */
open class CombinePageLoader<T> {
    public enum LoaderEvent {
        case started
        case pageLoaded(page: (Int, [T]))
        case completed(data: [T])
    }
    
    public typealias LoaderResult = Swift.Result<[T], Error>
    public typealias LoaderCompletion = (_ result: LoaderResult) -> Void
    public typealias FutureType = Future<(Int, [T]), PageLoaderError>
    public typealias LoaderType = (_ count: Int, _ page: Int, _ completion: @escaping LoaderCompletion) -> Void
    public typealias ResultSubjectType = CurrentValueSubject<LoaderEvent, Error>

    public var batchSize = BlockfrostConfig.DEFAULT_BATCH_SIZE
    public var loadCount = BlockfrostConfig.DEFAULT_COUNT
    public var maxPage: Int? = nil
    public var collectData = false

    var page = 1
    var terminate = false
    var isCancelled = false
    
    var acc: [T] = []
    var subscription = Set<AnyCancellable>()
    var subscriptionPageLoader: AnyCancellable? = nil

    var numPages = Atomic<Int>(0)
    var loader: LoaderType? = nil
    var pageLoadSubject: CurrentValueSubject<[FutureType], Error>? = nil
    var resultSubject: ResultSubjectType? = nil

    public init(batchSize: Int? = nil, loadCount: Int? = nil, maxPage: Int? = nil, collectData: Bool? = nil) {
        if let x = batchSize { self.batchSize = x }
        if let x = loadCount { self.loadCount = x }
        if let x = maxPage { self.maxPage = x }
        if let x = collectData { self.collectData = x }
    }

    open func cancel() {
        pageLoadSubject?.send(completion: .failure(PageLoaderCancelled()))
        isCancelled = true
    }

    open func cancelAll(){
        cancel()
        subscription.forEach {
            $0.cancel()
        }
        subscriptionPageLoader?.cancel()
    }

    open func stop(){
        terminate = true
    }

    open func getNumPages() -> Int {
        numPages.get()
    }

    fileprivate func nextLoadingFutures() -> [FutureType] {
        let promises = (0 ..< batchSize).map { i in
            FutureType { promise in
                let cpage = self.page + i
                if self.terminate || self.isCancelled {
                    promise(Swift.Result.success((cpage, [])))
                    return
                }
                self.loader?(self.loadCount, cpage) { lres in
                    switch(lres){
                    case let .failure(err):
                        promise(Swift.Result.failure(PageLoaderError(page: cpage, error: err)))
                        break
                    case let .success(dres):
                        promise(Swift.Result.success((cpage, dres)))
                        break
                    }
                }
            }
        }
        page += batchSize
        return promises
    }

    fileprivate func recvValue(_ res: [(Int, [T]?)] ) {
        let sself = self
        for (cpage, pres) in res {
            sself.resultSubject?.send(.pageLoaded(page: (cpage, pres ?? [])))

            if sself.collectData {
                pres?.forEach { it in
                    sself.acc.append(it)
                }
            }

            if pres?.isEmpty == true {
                sself.terminate = true
                break
            } else {
                sself.numPages.mutate { $0 += 1 }
            }
        }

        let cMaxPage = sself.maxPage
        if !sself.isCancelled && !sself.terminate && (cMaxPage == nil || sself.page < cMaxPage!) {
            sself.feedSubject()
        } else {
            sself.resultSubject?.send(.completed(data: sself.acc))
            sself.resultSubject?.send(completion: .finished)
        }
    }

    fileprivate func feedSubject(){
        pageLoadSubject?.send(nextLoadingFutures())
    }

    open func loadAll(_ loader: @escaping (_ count: Int, _ page: Int, _ completion: @escaping LoaderCompletion) -> Void,
                      completion: @escaping (_ result: LoaderResult) -> Void) -> Void
    {
        collectData = true
        load(loader).sink(receiveCompletion: { compl in
            switch(compl){
            case .finished:
                completion(.success(self.acc))
                break
            case let .failure(err):
                completion(.failure(err))
                break
            }
        }, receiveValue: {val in
            
        }).store(in: &subscription)
    }

    open func load(_ loader: @escaping (_ count: Int, _ page: Int, _ completion: @escaping LoaderCompletion) -> Void) -> AnyPublisher<LoaderEvent, Error>
    {
        page = 1
        numPages.set(0)
        terminate = false
        isCancelled = false
        acc.removeAll()
        subscription.removeAll()
        self.loader = loader

        // Create new subject with a initial batch
        pageLoadSubject = CurrentValueSubject<[FutureType], Error>(nextLoadingFutures())
        let resSubj = ResultSubjectType(.started)
        resultSubject = resSubj

        subscriptionPageLoader = pageLoadSubject?.sink(receiveCompletion: { compl in
            switch(compl) {
            case .finished: break
            case let .failure(err):
                resSubj.send(completion: .failure(err))
                break
            }
        }, receiveValue: { futs in
            Publishers.MergeMany(futs)
                .collect()
                .sort { a, b in a.0 < b.0 }
                .handleEvents(receiveCancel: { [weak self] in
                    self?.isCancelled = true
                })
                .sink(receiveCompletion: { [weak self] compl in
                    switch(compl){
                    case .finished: break
                    case let .failure(err):
                        self?.terminate = true
                        resSubj.send(completion: .failure(err))
                        break
                    }
                }, receiveValue: { [weak self] res in
                    guard let sself = self else {
                        return
                    }
                    sself.recvValue(res)
                }).store(in: &self.subscription)
        })
        
        return resSubj.handleEvents(receiveCancel: {
            self.cancel()
        }).eraseToAnyPublisher()
    }
}

extension Publisher where Output: Sequence {
    typealias Sorter = (Output.Element, Output.Element) -> Bool

    func sort(
            by sorter: @escaping Sorter
    ) -> Publishers.Map<Self, [Output.Element]> {
        map { sequence in
            sequence.sorted(by: sorter)
        }
    }
}

open class APILoaderRequest<T> : APIRequest {
    public let loader : PageLoader<T>?

    public init(loader: PageLoader<T>?) {
        self.loader = loader
        super.init()
    }

    override open func cancel() -> Bool {
        guard let ldr = loader else { return false }
        ldr.cancel()
        return true
    }
}
