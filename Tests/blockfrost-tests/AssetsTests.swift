//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
import XCTest
import Combine
import Quick
import Nimble
@testable import BlockfrostSwiftSDK

class AssetsTests: QuickSpec {
    override func spec() {
        describe("load assets") {
            var api: CardanoAssetsAPI!

            beforeEach {
                let cfg = TestUtils.initConfig()
                if cfg == nil {
                    fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
                }
                api = CardanoAssetsAPI(config: cfg)
            }

            it("all") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAssets() { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("by id") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAsset(asset: "b863bc7369f46136ac1048adb2fa7dae3af944c3bbb2be2f216a8d4f42657272795361707068697265") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.asset).to(equal("b863bc7369f46136ac1048adb2fa7dae3af944c3bbb2be2f216a8d4f42657272795361707068697265"))
                        expect(r.assetName).to(equal("42657272795361707068697265"))
                        expect(r.fingerprint).to(equal("asset1hwnpal5vap799t6kkjmjf6myhse4zl2vu4ahzz"))
                        expect(r.initialMintTxHash).to(equal("6556b532acf59835084f62d30675f3a55b78c61959bca44a86ea02c320fbf822"))
                        expect(r.metadata).to(beNil())
                        expect(r.mintOrBurnCount).to(equal(1))
                        expect(r.onchainMetadata).toNot(beEmpty())
                        expect(r.onchainMetadata).to(equal([
                            "color": "#0F52BA",
                            "image": "ipfs://ipfs/QmWxK9BvEbLGFZuQHL8zbHXSv469JrqnX3kUcZafjsoka4",
                            "name": "Berry Sapphire",
                        ]))
                        expect(r.policyId).to(equal("b863bc7369f46136ac1048adb2fa7dae3af944c3bbb2be2f216a8d4f"))
                        expect(r.quantity).to(equal("1"))
                        done()
                    }
                }
            }
            
            it("history") {
                waitUntil(timeout: 10) { done in
                    _ = api.getAssetHistory(asset: "00000002df633853f6a47465c9496721d2d5b1291b8398016c0e87ae6e7574636f696e") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).to(equal([AssetHistory(txHash: "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed", action: .minted, amount: "1")]))
                        done()
                    }
                }
            }

            it("historyAll") {
                BlockfrostConfig.DEFAULT_COUNT = 100
                waitUntil(timeout: 120) { done in
                    let _ = api.getAssetHistoryAll(asset: "d894897411707efa755a76deb66d26dfd50593f2e70863e1661e98a07370616365636f696e73") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.count).to(beGreaterThanOrEqualTo(2320))
                        for x in r {
                            expect(x.amount).to(beAKindOf(String.self))
                            expect(x.action).to(beAKindOf(AssetHistory.Action.self))
                            expect(x.amount).to(beAKindOf(String.self))
                        }
                        done()
                    }
                }
            }

            it("transactions") {
                waitUntil(timeout: 10) { done in
                    _ = api.getAssetTransactions(asset: "00000002df633853f6a47465c9496721d2d5b1291b8398016c0e87ae6e7574636f696e") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("addresses") {
                waitUntil(timeout: 10) { done in
                    _ = api.getAssetAddresses(asset: "00000002df633853f6a47465c9496721d2d5b1291b8398016c0e87ae6e7574636f696e") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("policy") {
                waitUntil(timeout: 10) { done in
                    _ = api.getPolicyAssets(policyId: "b863bc7369f46136ac1048adb2fa7dae3af944c3bbb2be2f216a8d4f") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            // TODO: empty policy
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
