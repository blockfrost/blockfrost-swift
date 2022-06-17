//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
import XCTest
import Combine
import Quick
import Nimble
@testable import BlockfrostSwiftSDK

class AddressesTests: QuickSpec {
    override func spec() {
        describe("load address") {
            var api: CardanoAddressesAPI!

            beforeEach {
                let cfg = TestUtils.initConfig()
                if cfg == nil {
                    fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
                }
                api = CardanoAddressesAPI(config: cfg)
            }

            it("addresses") {
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getAddress(address: "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        expect(r).toNot(beNil())
                        expect(r.type).to(equal(AddressContent.ModelType.shelley))
                        expect(r.amount).toNot(beEmpty())
                        expect(r.amount[0].unit).to(equal("lovelace"))
                        expect(r.amount[0].quantity).to(beAKindOf(String.self))
                        done()
                    }
                }
            }

            it("total / details") {
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getAddressDetails(address: "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.address).to(equal("addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y"))
                        expect(r.txCount).to(beAKindOf(Int.self))
                        self.checkAmount(r.receivedSum)
                        self.checkAmount(r.sentSum)
                        done()
                    }
                }
            }

            it("utxos") {
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    _ = api.getAddressUtxos(address: "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("txs"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getAddressTransactions(address: "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y") { resp in
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

    private func checkAmount(_ am: [TxContentOutputAmount]) {
        expect(am).toNot(beEmpty())
        for x in am {
            expect(x.quantity).to(beAKindOf(String.self))
            expect(x.unit).to(beAKindOf(String.self))
        }
    }
}
