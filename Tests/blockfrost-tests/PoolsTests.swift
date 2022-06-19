//
//  PoolsTests.swift
//  
//
//  Created by Dusan Klinec on 15.09.2021.
//

import Foundation
import XCTest
import Combine
import Quick
import Nimble
#if canImport(AnyCodable)
import AnyCodable
#endif
@testable import BlockfrostSwiftSDK

final class PoolsTests: QuickSpec {
    override func spec() {
        var api: CardanoPoolsAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoPoolsAPI(config: cfg)
        }

        describe("pools") {
            it("retiring"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getRetiringPools { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("retired"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getRetiredPools { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("all"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPools { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("byId"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPool(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.declaredPledge).to(equal("510000000000"))
                        expect(r.fixedCost).to(equal("340000000"))
                        expect(r.hex).to(equal("0f292fcaa02b8b2f9b3c8f9fd8e0bb21abedb692a6d5058df3ef2735"))
                        expect(r.marginCost).to(equal(0.049))
                        expect(r.owners).to(equal(["stake1u98nnlkvkk23vtvf9273uq7cph5ww6u2yq2389psuqet90sv4xv9v"]))
                        expect(r.poolId).to(equal("pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"))
                        expect(r.registration).to(equal(["a96c79773b7506211eb56bf94886a2face17657d1009f52fb5ea05f19cc8823e"]))
                        expect(r.retirement).to(equal([]))
                        expect(r.rewardAccount).to(equal("stake1u98nnlkvkk23vtvf9273uq7cph5ww6u2yq2389psuqet90sv4xv9v"))
                        expect(r.vrfKey).to(equal("b512cc7c1a8ba689c2d8fd27adfdbac2049a3f8f95c8b85e8298f14d7d8dc4e6"))
                        done()
                    }
                }
            }

            it("history"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolHistory(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("metadata"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolMetadata(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r?.poolId).to(equal("pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"))
                        done()
                    }
                }
            }

            it("delegators"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolDelegators(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("relays"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolRelays(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("blocks"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolBlocks(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy", count: 10) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("updates"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getPoolUpdates(poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy", count: 10) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

        }
    }
}
