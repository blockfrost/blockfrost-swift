//
//  EpochsTests.swift
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

final class EpochsTests: QuickSpec {
    override func spec() {
        var api: CardanoEpochsAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoEpochsAPI(config: cfg)
        }

        describe("epochs") {
            it("getLatest"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getLatestEpoch { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("epoch0"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getEpoch(number: 0) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.epoch).to(equal(0))
                        expect(r.startTime).to(equal(1506203091))
                        expect(r.endTime).to(equal(1506635091))
                        expect(r.firstBlockTime).to(equal(1506203091))
                        expect(r.lastBlockTime).to(equal(1506635071))
                        expect(r.blockCount).to(equal(21587))
                        expect(r.txCount).to(equal(33))
                        expect(r.output).to(equal("10378568796482912"))
                        expect(r.fees).to(equal("3458053"))
                        expect(r.activeStake).to(beNil())
                        done()
                    }
                }
            }

            it("epoch242"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getEpoch(number: 242) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.epoch).to(equal(242))
                        expect(r.startTime).to(equal(1610747091))
                        expect(r.endTime).to(equal(1611179091))
                        expect(r.firstBlockTime).to(equal(1610747091))
                        expect(r.lastBlockTime).to(equal(1611179076))
                        expect(r.blockCount).to(equal(21418))
                        expect(r.txCount).to(equal(74057))
                        expect(r.output).to(equal("63148817438049616"))
                        expect(r.fees).to(equal("16905060417"))
                        expect(r.activeStake).to(equal("21755094259019945"))
                        done()
                    }
                }
            }

            it("stakes242"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getActiveStakesForEpoch(number: 242) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("parameters267"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getEpochParam(number: 267) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.minFeeA).to(equal(44))
                        expect(r.minFeeB).to(equal(155381))
                        expect(r.maxBlockSize).to(equal(65536))
                        expect(r.maxTxSize).to(equal(16384))
                        expect(r.maxBlockHeaderSize).to(equal(1100))
                        expect(r.keyDeposit).to(equal("2000000"))
                        expect(r.poolDeposit).to(equal("500000000"))
                        expect(r.eMax).to(equal(18))
                        expect(r.nOpt).to(equal(500))
                        expect(r.a0).to(equal(0.3))
                        expect(r.rho).to(equal(0.003))
                        expect(r.tau).to(equal(0.2))
                        expect(r.decentralisationParam).to(equal(0))
                        expect(r.extraEntropy).to(beNil())
                        expect(r.protocolMajorVer).to(equal(4))
                        expect(r.protocolMinorVer).to(equal(0))
                        expect(r.minUtxo).to(equal("1000000"))
                        expect(r.minPoolCost).to(equal("340000000"))
                        done()
                    }
                }
            }

            it("next"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getNextEpochs(number: 242) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r[0].epoch).to(equal(243))
                        done()
                    }
                }
            }

            it("prev"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getPreviousEpochs(number: 242) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r[0].epoch).to(beLessThan(242))
                        done()
                    }
                }
            }

            it("blocks"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getBlocksForEpoch(number: 242, count: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("blocksAndPool"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getBlocksForEpochAndPool(number: 242, poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy") { resp in
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
