//
//  File.swift
//  
//
//  Created by Dusan Klinec on 15.09.2021.
//

import Foundation
import XCTest
import Combine
@testable import BlockfrostSwiftSDK

final class BlockTests: XCTestCase {
    private let modelName = "Blocks"
    private var config = BlockfrostConfig()
    private var subscriptions = Set<AnyCancellable>()

    private static let LOAD_PAGES = 15
    private static let PAGE_CANCEL = 12
    private static let PAGE_FAIL = 12

    override func setUpWithError() throws {
        config = BlockfrostConfig()
        config.basePath = TestConsts.TEST_URL

        guard let projectId = TestUtils.getEnvProjectId() else {
            XCTFail("Project ID is not defined, use env var BF_PROJECT_ID")
            throw NSError(domain: "Test failed, projectID not defined", code: 0)
        }
        config.projectId = projectId

        BlockfrostStaticConfig.basePath = config.basePath
        BlockfrostStaticConfig.projectId = config.projectId

        BlockfrostConfig.DEFAULT_COUNT = 10  // not to stress backend too much with page loaders
    }

    override func tearDown() {
    }

    func testNextBlocks() {
        let expectation = XCTestExpectation(description: "getNextBlocks")
        let api = CardanoBlocksAPI(config: config)
        let _ = api.getNextBlocks(hashOrNumber: "2828500") { resp in
            switch(resp){
            case let .failure(err):
                XCTFail("Req failed: \(err)")
            case let .success(r):
                XCTAssert(r.count > 0)
                XCTAssertEqual(r[0].height, 2828501)
                XCTAssertEqual(r[0].time, 1628835022)
                XCTAssertEqual(r[0].slot, 34465806)
                XCTAssertEqual(r[0].epoch, 150)
                XCTAssertEqual(r[0].epochSlot, 35406)
                XCTAssertEqual(r[0].hash, "ec272cc78b0a73e47786169251e10fc051cdcb82c729d79a3619e79ac874bb78")
                XCTAssertEqual(r[0].size, 3)
                XCTAssertEqual(r[0].txCount, 0)
                XCTAssertEqual(r[0].fees, nil)
                XCTAssertEqual(r[0].output, nil)
                XCTAssertEqual(r[0].blockVrf, "vrf_vk1ednlq9xx8kvhxlwah0l5ph9tp000ssemaaesv7athfm3uevl2gvqdkajlw")
                XCTAssertEqual(r[0].previousBlock, "91e729ad104b1192042888abe97886e74d7fbc2315be6f0702ee6979c98ad223")
                XCTAssertEqual(r[0].nextBlock, "5b06e069619500b062a6001c459ef68aa52af84894de7ee2c55b1adb090cbd73")
                XCTAssertEqual(r[1].hash, "5b06e069619500b062a6001c459ef68aa52af84894de7ee2c55b1adb090cbd73")

                XCTAssertEqual(r[10].fees, "250000")
                XCTAssertEqual(r[10].output, "1236157")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    func fixtureGetLatestBlock() -> BlockContent? {
        let expGetLatest = XCTestExpectation(description: "getLatestBlock")
        let api = CardanoBlocksAPI(config: config)
        var lastBlock: BlockContent? = nil

        let _ = api.getLatestBlock { resp in
            switch(resp){
            case let .failure(err):
                XCTFail("Req failed: \(err)")
                break
            case let .success(r):
                lastBlock = r
                break
            }
            expGetLatest.fulfill()
        }
        wait(for: [expGetLatest], timeout: 10)
        return lastBlock
    }

    func fixtureDispatchLoader(api: CardanoBlocksAPI, blockToLoad: String, pageFail: Int? = nil, pageCancel: Int? = nil,
                               completion: @escaping (_ loader: DispatchPageLoader<BlockContent>, _ result: DispatchPageLoader<BlockContent>.LoaderResult) -> Void)
    {
        let loader = DispatchPageLoader<BlockContent>()
        loader.loadAll({ (count, page, compl) in
            if pageFail != nil && page == pageFail {
                compl(.failure(NSError(domain: "PlannedFailure", code: 0)))
            } else if pageCancel != nil && page == pageCancel {
                DispatchQueue.global().async { loader.cancel() }
            } else {
                let _ = api.getNextBlocks(hashOrNumber: blockToLoad, count: count, page: page, apiResponseQueue: .main, completion: compl)
            }
        }, completion: { resp in completion(loader, resp) })
    }

    func fixtureCombineLoader(api: CardanoBlocksAPI,
                              blockToLoad: String, onCancelled: (()->())? = nil,
                              pageFail: Int? = nil, pageCancel: Int? = nil, cancelBlock: (()->())? = nil
    ) -> AnyPublisher<PageLoader<BlockContent>.LoaderEvent, Error> {
        let loader = PageLoader<BlockContent>()
        var subs: AnyPublisher<PageLoader<BlockContent>.LoaderEvent, Error>
        subs = loader.load({ (count, page, compl) in
            if pageFail != nil && page == pageFail {
                compl(.failure(NSError(domain: "PlannedFailure", code: 0)))
            } else if pageCancel != nil && page == pageCancel {
                DispatchQueue.global().async { cancelBlock?() }
            } else {
                let _ = api.getNextBlocks(hashOrNumber: blockToLoad, count: count, page: page, apiResponseQueue: .main, completion: compl)
            }
        })
        .handleEvents(receiveCancel: {
            onCancelled?()
        }).eraseToAnyPublisher()
        return subs
    }

    func testNextBlocksAll() {
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = false
        let ex2 = XCTestExpectation(description: "Async")
        fixtureDispatchLoader(api: api, blockToLoad: blockToLoad) { loader, res in
            switch (res) {
            case let .failure(err):
                XCTFail("Loader failed: \(err)")
                break
            case let .success(res):
                isOk = true
                XCTAssertTrue(res.count >= BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES)
                XCTAssertEqual(res[0].height, lastBlock!.height! - loadOffset + 1)
                break
            }
            ex2.fulfill()
        }
        wait(for: [ex2], timeout: 10)
        XCTAssertTrue(isOk)
    }

    func testNextBlocksAllCancel(){
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = false
        let ex2 = XCTestExpectation(description: "Async")
        fixtureDispatchLoader(api: api, blockToLoad: blockToLoad, pageCancel: BlockTests.PAGE_CANCEL) { loader, res in
            switch (res) {
            case let .failure(err):
                XCTAssertTrue(err is PageLoaderCancelled)
                isOk = true
                break
            case .success(_):
                XCTFail("Loader succeeded, but should have been cancelled")
                break
            }
            ex2.fulfill()
        }
        wait(for: [ex2], timeout: 10)
        XCTAssertTrue(isOk)
    }

    func testNextBlocksAllFail(){
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = false
        let ex2 = XCTestExpectation(description: "Async")
        fixtureDispatchLoader(api: api, blockToLoad: blockToLoad, pageFail: BlockTests.PAGE_FAIL) { loader, res in
            switch (res) {
            case let .failure(err):
                XCTAssertTrue(err is PageLoaderError)
                XCTAssertEqual((err as! PageLoaderError).page, BlockTests.PAGE_FAIL)
                isOk = true
                break
            case .success(_):
                XCTFail("Loader succeeded, but should have failed")
                break
            }
            ex2.fulfill()
        }
        wait(for: [ex2], timeout: 10)
        XCTAssertTrue(isOk)
    }

    func testNextBlocksAllCombine() {
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = 0
        let ex1 = XCTestExpectation(description: "Async")
        let ex2 = XCTestExpectation(description: "Async")
        fixtureCombineLoader(api: api, blockToLoad: blockToLoad, onCancelled: { ex1.fulfill(); ex2.fulfill() })
            .sink(receiveCompletion: { comp in
                switch(comp){
                case .finished:
                    isOk += 1
                    break
                case let .failure(err):
                    XCTFail("Loader failed: \(err)")
                    break
                }
                ex2.fulfill()
            }, receiveValue: { val in
                switch(val){
                case .started: break
                case let .pageLoaded(page):
                    if page.0 == 1 {
                        isOk += 1
                        XCTAssertTrue(page.1.count >= 1)
                        XCTAssertEqual(page.1[0].height, lastBlock!.height! - loadOffset + 1)
                    } else if page.0 == BlockTests.LOAD_PAGES {
                        isOk += 1
                        XCTAssertTrue(page.1.count >= 1)
                    }
                    break
                case .completed(_):
                    isOk += 1
                    ex1.fulfill()
                    break
                }
            }).store(in: &subscriptions)
        wait(for: [ex1, ex2], timeout: 10)
        XCTAssertEqual(isOk, 4)
    }

    func testNextBlocksAllCombineCancel() {
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = 0
        let ex1 = XCTestExpectation(description: "Async")
        var subs = [AnyCancellable { }]

        subs[0] = fixtureCombineLoader(api: api, blockToLoad: blockToLoad,
                onCancelled: {
                    isOk += 1
                    ex1.fulfill()
                },
                pageCancel: BlockTests.PAGE_CANCEL,
                cancelBlock: {
                    subs[0].cancel()
                }
        ).sink(receiveCompletion: { comp in
                switch(comp){
                case .finished:
                    XCTFail("Loader finished successfully but should have been cancelled")
                    break
                case let .failure(err):
                    XCTFail("Subscription cancellation should not trigger sink completion: \(err)")
                    break
                }
                ex1.fulfill()
            }, receiveValue: { val in
                switch(val){
                case .started: break
                case let .pageLoaded(page):
                    if page.0 == BlockTests.LOAD_PAGES {
                        XCTFail("Loader loaded too far")
                    }
                    break
                case .completed(_):
                    break
                }
            })

        wait(for: [ex1], timeout: 10)
        XCTAssertEqual(isOk, 1)
    }

    func testNextBlocksAllCombineFail() {
        let api = CardanoBlocksAPI(config: config)
        let lastBlock = fixtureGetLatestBlock()
        XCTAssertNotNil(lastBlock)

        let loadOffset = BlockfrostConfig.DEFAULT_COUNT * BlockTests.LOAD_PAGES
        let blockToLoad = String(lastBlock!.height! - loadOffset)

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var isOk = 0
        let ex1 = XCTestExpectation(description: "Async")

        fixtureCombineLoader(api: api, blockToLoad: blockToLoad,
                onCancelled: {
                    XCTFail("Load fail should not trigger cancellation")
                    ex1.fulfill()
                },
                pageFail: BlockTests.PAGE_FAIL
        ).sink(receiveCompletion: { comp in
                switch(comp){
                case .finished:
                    XCTFail("Loader finished successfully but should have been cancelled")
                    break
                case let .failure(err):
                    XCTAssertTrue(err is PageLoaderError)
                    XCTAssertEqual((err as! PageLoaderError).page, BlockTests.PAGE_FAIL)
                    isOk += 1
                    break
                }
                ex1.fulfill()
            }, receiveValue: { val in
                switch(val){
                case .started: break
                case let .pageLoaded(page):
                    if page.0 == BlockTests.LOAD_PAGES {
                        XCTFail("Loader loaded too far")
                    }
                    break
                case .completed(_):
                    break
                }
            }).store(in: &subscriptions)

        wait(for: [ex1], timeout: 10)
        XCTAssertEqual(isOk, 1)
    }

}
