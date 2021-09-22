//
//  File.swift
//  
//
//  Created by Dusan Klinec on 15.09.2021.
//

import Foundation
import XCTest
import Combine
import Quick
import Nimble
@testable import BlockfrostSwiftSDK

final class BlockTests: QuickSpec {
    override func spec() {
        var config = BlockfrostConfig()
        var api: CardanoBlocksAPI!
        var lastBlock: BlockContent? = nil

        let LOAD_PAGES = 15
        let PAGE_CANCEL = 12
        let PAGE_FAIL = 12

        beforeSuite {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fail("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            config = cfg!
            api = CardanoBlocksAPI(config: cfg)
        }

        beforeEach {
            api = CardanoBlocksAPI(config: config)
        }

        it("testNextBlocks_willLoadSinglePage") {
            waitUntil(timeout: 3) { done in
                let _ = api.getNextBlocks(hashOrNumber: "2828500") { resp in
                    guard let r = TestUtils.getResult(resp: resp) else {
                        done(); return;
                    }

                    expect(r).toNot(beEmpty())
                    expect(r[0].height).to(equal(2828501))
                    expect(r[0].time).to(equal(1562803711))
                    expect(r[0].slot).to(equal(2830031))
                    expect(r[0].epoch).to(equal(131))
                    expect(r[0].epochSlot).to(equal(431))
                    expect(r[0].hash).to(equal("cf1ef63c5655e1f883f1d3f7a79adc0823434c2a394ed7436e58412a75ed8d01"))
                    expect(r[0].size).to(equal(1575))
                    expect(r[0].txCount).to(equal(2))
                    expect(r[0].fees).to(equal("352996"))
                    expect(r[0].output).to(equal("2772474536329"))
                    expect(r[0].blockVrf).to(beNil())
                    expect(r[0].previousBlock).to(equal("89ee431a3591ea083a4d2c0c29e2f0569a2a63680fbe7fb5ecc4cd53254dcac2"))
                    expect(r[0].nextBlock).to(equal("ea4142ae8425eb68bbeaed133f5b80f697d80a56b32fa4f506a1db69c6fd73c5"))
                    expect(r[1].hash).to(equal("ea4142ae8425eb68bbeaed133f5b80f697d80a56b32fa4f506a1db69c6fd73c5"))
                    expect(r[10].fees).to(beNil())
                    expect(r[10].output).to(beNil())
                    done()
                }
            }
        }

        describe("PageLoader tests on blocks") {
            var subscriptions = Set<AnyCancellable>()
            var loadOffset: Int!
            var blockToLoad: String!

            beforeSuite {
                // Load latest block on the chain
                waitUntil(timeout: 3) { done in
                    let _ = api.getLatestBlock { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        lastBlock = r
                        done()
                    }
                }
                expect(lastBlock).toNot(beNil())
            }

            beforeEach {
                subscriptions.removeAll()
                loadOffset = BlockfrostConfig.DEFAULT_COUNT * LOAD_PAGES
                blockToLoad = String(lastBlock!.height! - loadOffset)
            }

            describe("DispatchPageLoader") {
                it("testNextBlocksAll_willLoadAllPages") {
                    var isOk = false
                    waitUntil(timeout: 10) { done in
                        self.fixtureDispatchLoader(api: api, blockToLoad: blockToLoad) { loader, resp in
                            guard let res = TestUtils.getResult(resp: resp) else {
                                done(); return;
                            }

                            isOk = true
                            expect(res.count).to(beGreaterThanOrEqualTo(BlockfrostConfig.DEFAULT_COUNT * LOAD_PAGES))
                            expect(res[0].height).to(equal(lastBlock!.height! - loadOffset + 1))
                            done()
                        }
                    }
                    expect(isOk).to(beTrue())
                }

                it("testNextBlocksAll_willBeCancelledOnPage12") {
                    var isOk = false
                    waitUntil(timeout: 10) { done in
                        self.fixtureDispatchLoader(api: api, blockToLoad: blockToLoad, pageCancel: PAGE_CANCEL) { loader, res in
                            switch (res) {
                            case let .failure(err):
                                expect(err).to(matchError(PageLoaderCancelled.self))
                                isOk = true
                                break
                            case .success(_):
                                XCTFail("Loader succeeded, but should have been cancelled")
                                break
                            }
                            done()
                        }
                    }
                    expect(isOk).to(beTrue())
                }

                it("testNextBlocksAll_willFailOnPage12") {
                    var isOk = false
                    waitUntil(timeout: 10) { done in
                        self.fixtureDispatchLoader(api: api, blockToLoad: blockToLoad, pageFail: PAGE_FAIL) { loader, res in
                            switch (res) {
                            case let .failure(err):
                                expect(err).to(matchError(PageLoaderError.self))
                                expect((err as! PageLoaderError).page).to(equal(PAGE_FAIL))
                                isOk = true
                                break
                            case .success(_):
                                fail("Loader succeeded, but should have failed")
                                break
                            }
                            done()
                        }
                    }
                    expect(isOk).to(beTrue())
                }
            }

            describe("CombinePageLoader") {
                it("testNextBlocksAll_willLoadAllPages") {
                    var isOk = 0
                    let ex1 = XCTestExpectation(description: "Async")
                    let ex2 = XCTestExpectation(description: "Async")
                    self.fixtureCombineLoader(api: api, blockToLoad: blockToLoad, onCancelled: { ex1.fulfill(); ex2.fulfill() })
                        .sink(receiveCompletion: { comp in
                            switch(comp){
                            case .finished:
                                isOk += 1
                                break
                            case let .failure(err):
                                fail("Loader failed: \(err)")
                                break
                            }
                            ex2.fulfill()
                        }, receiveValue: { val in
                            switch(val){
                            case .started: break
                            case let .pageLoaded(page):
                                if page.0 == 1 {
                                    isOk += 1
                                    expect(page.1).toNot(beEmpty())
                                    expect(page.1[0].height).to(equal(lastBlock!.height! - loadOffset + 1))
                                } else if page.0 == LOAD_PAGES {
                                    isOk += 1
                                    expect(page.1).toNot(beEmpty())
                                }
                                if page.0 > LOAD_PAGES + 1 && page.1.count > 0 {
                                    fail("Loader loaded too many pages: \(page.0) for block \(blockToLoad ?? "")")
                                }
                                break
                            case .completed(_):
                                isOk += 1
                                ex1.fulfill()
                                break
                            }
                        }).store(in: &subscriptions)
                    self.wait(for: [ex1, ex2], timeout: 10)
                    expect(isOk).to(equal(4))
                }

                it("testNextBlocksAll_willBeCancelledOnPage12") {
                    var isOk = 0
                    waitUntil(timeout: 10) { done in
                        var subs = [AnyCancellable { }]
                        subs[0] = self.fixtureCombineLoader(api: api, blockToLoad: blockToLoad,
                                onCancelled: {
                                    isOk += 1
                                    done()
                                },
                                pageCancel: PAGE_CANCEL,
                                cancelBlock: {
                                    subs[0].cancel()
                                }
                        ).sink(receiveCompletion: { comp in
                            switch(comp){
                            case .finished:
                                fail("Loader finished successfully but should have been cancelled")
                                break
                            case let .failure(err):
                                fail("Subscription cancellation should not trigger sink completion: \(err)")
                                break
                            }
                            done()
                        }, receiveValue: { val in
                            switch(val){
                            case .started: break
                            case let .pageLoaded(page):
                                if page.0 >= LOAD_PAGES {
                                    fail("Loader loaded too far")
                                }
                                break
                            case .completed(_):
                                break
                            }
                        })
                    }
                    expect(isOk).to(equal(1))
                }

                it("testNextBlocksAll_willFailOnPage12") {
                    var isOk = 0
                    waitUntil(timeout: 10) { done in
                        self.fixtureCombineLoader(api: api, blockToLoad: blockToLoad,
                                onCancelled: {
                                    fail("Load fail should not trigger cancellation")
                                    done()
                                },
                                pageFail: PAGE_FAIL
                        ).sink(receiveCompletion: { comp in
                            switch(comp){
                            case .finished:
                                fail("Loader finished successfully but should have been cancelled")
                                break
                            case let .failure(err):
                                expect(err).to(matchError(PageLoaderError.self))
                                expect((err as! PageLoaderError).page).to(equal(PAGE_FAIL))
                                isOk += 1
                                break
                            }
                            done()
                        }, receiveValue: { val in
                            switch(val){
                            case .started: break
                            case let .pageLoaded(page):
                                if page.0 >= LOAD_PAGES {
                                    fail("Loader loaded too far")
                                }
                                break
                            case .completed(_):
                                break
                            }
                        }).store(in: &subscriptions)
                    }
                    expect(isOk).to(equal(1))
                }
            }
        }
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

}
