//
//  TransactionsTests.swift
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

final class TransactionsTests: QuickSpec {
    override func spec() {
        var api: CardanoTransactionsAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoTransactionsAPI(config: cfg)
        }

        describe("transactions") {
            
            it("byHash"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransaction(hash: "28172ea876c3d1e691284e5179fae2feb3e69d7d41e43f8023dc380115741026") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.block).to(equal("e6369fee087d31192016b1659f1c381e9fc4925339278a4eef6f340c96c1947f"))
                        expect(r.blockHeight).to(equal(5040611))
                        expect(r.index).to(equal(0))
                        expect(r.outputAmount).to(equal([TxContentOutputAmount(unit: "lovelace", quantity: "701374004958")]))
                        expect(r.fees).to(equal("874781"))
                        expect(r.deposit).to(equal("0"))
                        expect(r.size).to(equal(16346))
                        expect(r.invalidBefore).to(beNil())
                        expect(r.invalidHereafter).to(equal("15657684"))
                        expect(r.utxoCount).to(equal(80))
                        expect(r.withdrawalCount).to(equal(0))
                        expect(r.delegationCount).to(equal(0))
                        expect(r.stakeCertCount).to(equal(0))
                        expect(r.poolUpdateCount).to(equal(0))
                        expect(r.poolRetireCount).to(equal(0))
                        done()
                    }
                }
            }

            it("utxos"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionUtxos(hash: "927edb96f3386ab91b5f5d85d84cb4253c65b1c2f65fa7df25f81fab1d62987a") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.hash).to(equal("927edb96f3386ab91b5f5d85d84cb4253c65b1c2f65fa7df25f81fab1d62987a"))
                        expect(r.inputs).to(equal([]))
                        expect(r.outputs).to(equal([
                            TxContentUtxoOutputs(
                                address: "Ae2tdPwUPEZ9vtyppa1FdJzvqJZkEcXgdHxVYAzTWcPaoNycVq5rc36LC1S",
                                amount: [TxContentUtxoAmount(unit: "lovelace", quantity: "538861000000")])]))
                        done()
                    }
                }
            }

            it("withdrawals"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionWithdrawals(hash: "9f811b021492a5544207f7b566b4e67c87f0918b9e7055ab3074d552ab18e895") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(1))
                        expect(r[0].address).to(equal("stake1ux77thpfertrfhkq3tlmssucn30ddvvn3s9fhvkvx7dd3msgmxve0"))
                        expect(r[0].amount).to(equal("7911187966"))
                        done()
                    }
                }
            }

            it("mirs"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionMirs(hash: "7b57f2cf1c442c563647ab29669c88b9116c2668d31d42526ff27ed614da1252") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("delegations"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionDelegations(hash: "c2120581050a1116ab38a5ac8a62d64df4cf12cf3370d22337201d36eb65fcc4") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(1))
                        expect(r[0].index).to(equal(1))
                        expect(r[0].certIndex).to(equal(1))
                        expect(r[0].address).to(equal("stake1uyhk4jwrrp683w8n9hutkddr0nns4nuun04m2x3a6v0s9cck0z4k9"))
                        expect(r[0].poolId).to(equal("pool1zgxvcqf0dvh0ze56ev2ayjvuex3zdd3hgxzdrcezkx497mv3l7s"))
                        done()
                    }
                }
            }

            it("pool updates"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionPoolUpdates(hash: "28bd5e8c342ab89d6642e446cb299058ea36256af1718e4af9326898ce4192d7") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(2))

                        expect(r[0].certIndex).to(equal(0))
                        expect(r[0].poolId).to(equal("pool1kchver88u3kygsak8wgll7htr8uxn5v35lfrsyy842nkscrzyvj"))
                        expect(r[0].vrfKey).to(equal("b4506cbdf5faeeb7bc771d0c17eea2e7e94749ec5a63e78a42d9ed8aad6baae5"))
                        expect(r[0].pledge).to(equal("100000000000"))
                        expect(r[0].marginCost).to(equal(0.018))
                        expect(r[0].fixedCost).to(equal("340000000"))
                        expect(r[0].rewardAccount).to(equal("stake1u97v0sjx96u5lydjfe2g5qdwkj6plm87h80q5vc0ma6wjpq22mh4c"))
                        expect(r[0].owners).to(equal(["stake1ux69nctlngdhx99a6w8hrtexu89p9prqk8vmseg9qmmquyqhuns53"]))

                        let meta0 = (r[0].metadata?.value) as? [String: Any?]
                        expect(meta0).toNot(beNil())
                        expect(meta0!["url"] as? String).to(equal("https://stakhanovite.io/cardano/stkh-1.json"))
                        expect(meta0!["hash"] as? String).to(equal("0f519c0478527c6fd05556ecb31fafe9e5a6b9861fac96f5935381b3e328ee5d"))
                        expect(meta0!["ticker"] as? String).toNot(beNil())
                        expect(meta0!["name"] as? String).toNot(beNil())
                        expect(meta0!["description"] as? String).toNot(beNil())
                        expect(meta0!["homepage"] as? String).toNot(beNil())

                        expect(r[0].relays).toNot(beEmpty())
                        expect((r[0].relays[0].value as? [String: Any?])?["ipv4"] as? String).to(beNil())
                        expect((r[0].relays[0].value as? [String: Any?])?["ipv6"] as? String).to(beNil())
                        expect((r[0].relays[0].value as? [String: Any?])?["dns"] as? String).to(equal("cardano-relay.stakhanovite.io"))
                        expect((r[0].relays[0].value as? [String: Any?])?["dns_srv"] as? String).to(beNil())
                        expect((r[0].relays[0].value as? [String: Any?])?["port"] as? Int).to(equal(7001))

                        expect(r[1].certIndex).to(equal(1))
                        expect(r[1].poolId).to(equal("pool1s7t7mfc89syw93h07aammaccnua66yn6d4l0mqt7zqurz2mczvq"))
                        expect(r[1].vrfKey).to(equal("f399304ca66731d66b739e4df6a94f32ab10b34450fb21b03720d2c1d45d59d2"))
                        expect(r[1].pledge).to(equal("10000000000"))
                        expect(r[1].marginCost).to(equal(0.018))
                        expect(r[1].fixedCost).to(equal("340000000"))
                        expect(r[1].rewardAccount).to(equal("stake1u97v0sjx96u5lydjfe2g5qdwkj6plm87h80q5vc0ma6wjpq22mh4c"))
                        expect(r[1].owners).to(equal(["stake1uxclfpuwmmsdxjtqy7ee845246xlk6k4r5rxj6sexsh8caqf2z5dm"]))

                        let meta1 = (r[1].metadata?.value) as? [String: Any?]
                        expect(meta1).toNot(beNil())
                        expect(meta1!["url"] as? String).to(equal("https://stakhanovite.io/cardano/stkh-2.json"))
                        expect(meta1!["hash"] as? String).to(equal("11171d873f8f5b704552111d75b629f840b1c3399b49d9642cf12970031583b7"))
                        expect(meta1!["ticker"] as? String).to(beNil())
                        expect(meta1!["name"] as? String).to(beNil())
                        expect(meta1!["description"] as? String).to(beNil())
                        expect(meta1!["homepage"] as? String).to(beNil())

                        expect(r[1].relays).toNot(beEmpty())
                        expect((r[1].relays[0].value as? [String: Any?])?["ipv4"] as? String).to(beNil())
                        expect((r[1].relays[0].value as? [String: Any?])?["ipv6"] as? String).to(beNil())
                        expect((r[1].relays[0].value as? [String: Any?])?["dns"] as? String).to(equal("cardano-relay.stakhanovite.io"))
                        expect((r[1].relays[0].value as? [String: Any?])?["dns_srv"] as? String).to(beNil())
                        expect((r[1].relays[0].value as? [String: Any?])?["port"] as? Int).to(equal(7001))

                        done()
                    }
                }
            }

            it("stakes"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionStakes(hash: "c2120581050a1116ab38a5ac8a62d64df4cf12cf3370d22337201d36eb65fcc4") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(1))
                        expect(r[0].certIndex).to(equal(0))
                        expect(r[0].address).to(equal("stake1uyhk4jwrrp683w8n9hutkddr0nns4nuun04m2x3a6v0s9cck0z4k9"))
                        expect(r[0].registration).to(equal(true))
                        done()
                    }
                }
            }

            it("pool retires"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionPoolRetires(hash: "33770d42c7bc8a9a0bc9830ffb97941574dc61dc534796dd8614b99b6aadace4") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(1))
                        expect(r[0].certIndex).to(equal(0))
                        expect(r[0].poolId).to(equal("pool1g36eg8e6tr6sur6y3cfpd8lglny3axh6pgka3acpnfyh22svdth"))
                        expect(r[0].retiringEpoch).to(equal(236))
                        done()
                    }
                }
            }

            it("tsxMetadata"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTransactionMetadata(hash: "e641005803337a553a03cf3c11a1819491a629bd7d0a3c39e4866a01b5dac36d") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(1))
                        expect(r[0].label).to(equal("1968"))

                        expect(CodableHelper.eqAny(r[0].jsonMetadata,
                            ["TSLA": [["value": "865.85", "source": "investorsExchange"]],
                             "DRAND": ["round": 492700, "randomness": "22966996b523a4726c3df9d7b8bae50230ef08a7452c53d64eacc2dad632afc5"],
                             "ADABTC": [["value": "7.96e-06", "source": "coinGecko"]],
                             "ADAEUR": [["value": "0.260806", "source": "coinGecko"]],
                             "ADAUSD": [["value": "0.318835", "source": "coinGecko"], ["value": "0.32190816861292343", "source": "ergoOracles"]],
                             "AGIBTC": [["value": "0.077643", "source": "coinGecko"]],
                             "BTCUSD": [["value": "40088", "source": "coinGecko"]],
                             "ERGUSD": [["value": "0.573205", "source": "coinGecko"], ["value": "0.5728722202262749", "source": "ergoOracles"]],
                             "BTCDIFF": [["value": "20607418304385.63", "source": "blockBook"]]])).to(beTrue())


                        expect(CodableHelper.eqAny(r[0].jsonMetadata,
                            ["TSLA": [["value": "865.851", "source": "investorsExchange"]],
                             "DRAND": ["round": 492700, "randomness": "22966996b523a4726c3df9d7b8bae50230ef08a7452c53d64eacc2dad632afc5"],
                             "ADABTC": [["value": "7.96e-06", "source": "coinGecko"]],
                             "ADAEUR": [["value": "0.260806", "source": "coinGecko"]],
                             "ADAUSD": [["value": "0.318835", "source": "coinGecko"], ["value": "0.32190816861292343", "source": "ergoOracles"]],
                             "AGIBTC": [["value": "0.077643", "source": "coinGecko"]],
                             "BTCUSD": [["value": "40088", "source": "coinGecko"]],
                             "ERGUSD": [["value": "0.573205", "source": "coinGecko"], ["value": "0.5728722202262749", "source": "ergoOracles"]],
                             "BTCDIFF": [["value": "20607418304385.63", "source": "blockBook"]]])).to(beFalse())

                        done()
                    }
                }
            }

            it("submit") {
                let dummyTx = "33770d42c7bc8a9a0bc9830ffb97941574dc61dc534796dd8614b99b6aadace4".data(using: .ascii)!
                waitUntil(timeout: 3) { done in
                    let _ = api.submitTransaction(transaction: dummyTx) { resp in
                        switch (resp) {
                        case let .failure(err):
                            expect(err).to(matchError(ErrorResponse.self))
                            let respErr = err as! ErrorResponse
                            if case let .errorStatus(scode, status, _, _) = respErr {
                                expect(scode).to(equal(400))
                                expect(status.statusCode).to(equal(400))
                            } else {
                                fail("Invalid error message")
                            }
                            break
                        case .success(_):
                            fail("Did not expect to succeed")
                            break
                        }
                        done()
                    }
                }
            }

            
        }
    }
}
