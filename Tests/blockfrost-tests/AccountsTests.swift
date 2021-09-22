//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
import XCTest
import Combine
import Quick
import Nimble
@testable import BlockfrostSwiftSDK

class AccountsTests: QuickSpec {
    override func spec() {
        describe("load accounts") {
            var config = BlockfrostConfig()
            var api: CardanoAccountsAPI!

            beforeEach {
                let cfg = TestUtils.initConfig()
                if cfg == nil {
                    fail("Project ID is not defined, use env var BF_PROJECT_ID")
                }
                config = cfg!
                api = CardanoAccountsAPI(config: cfg)
            }

            it("loads accounts for stake address") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: "stake1u8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkgs46q0w") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        expect(r).toNot(beNil())
                        expect(r.stakeAddress).to(equal("stake1u8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkgs46q0w"))
                        expect(r.active).to(beAKindOf(Bool.self))
                        expect(r.activeEpoch).to(beAKindOf(Int.self))
                        expect(r.controlledAmount).to(beAKindOf(String.self))
                        expect(r.rewardsSum).to(beAKindOf(String.self))
                        expect(r.reservesSum).to(beAKindOf(String.self))
                        expect(r.treasurySum).to(beAKindOf(String.self))
                        expect(r.withdrawableAmount).to(beAKindOf(String.self))
                        expect(r.poolId).to(beNil())
                        done()
                    }
                }
            }

            it("rewards") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountRewardHistory(stakeAddress: "stake1u9fzg77vrgfqlplkjqe9hntdcvsurpvxd60yp2fhn73002qsv9pdk", count: 3, page: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        
                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        let expRes = [
                            AccountRewardContent(epoch: 229, amount: "171419599", poolId: "pool1vx9tzlkgafernd9vpjpxkenutx2gncj4yn88fpq69823qlwcqrt"),
                            AccountRewardContent(epoch: 230, amount: "160736772", poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"),
                            AccountRewardContent(epoch: 231, amount: "210662173", poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"),
                        ]
                        expect(r).to(equal(expRes))
                        done()
                    }
                }
            }

            it("history") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountHistory(stakeAddress: "stake1u9fzg77vrgfqlplkjqe9hntdcvsurpvxd60yp2fhn73002qsv9pdk", count: 3, page: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        let expRes = [
                            AccountHistoryContent(activeEpoch: 229, amount: "220098162468", poolId: "pool1vx9tzlkgafernd9vpjpxkenutx2gncj4yn88fpq69823qlwcqrt"),
                            AccountHistoryContent(activeEpoch: 230, amount: "220268640006", poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"),
                            AccountHistoryContent(activeEpoch: 231, amount: "220428767042", poolId: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"),
                        ]
                        expect(r).to(equal(expRes))
                        done()
                    }
                }
            }

            it("delegations") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountDelegationHistory(stakeAddress: "stake1u9a3t4rgddm4expj0ucyxhxg3ft9ugk2ry6r9w69h04ea6cfj887f") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        let expRes = [
                            AccountDelegationContent(activeEpoch: 220, txHash: "0bcdf4f6378b2183d738b17c8a2daa6a94f0ddf78133b73fccea0eece3ab1b56",
                                    amount: "2653774", poolId: "pool16kus5xvdysgmtjp0hhlwt72tsm0yn2zcn0a8wg9emc6c75lxvmc"),
                        ]
                        expect(r).to(equal(expRes))
                        done()
                    }
                }
            }

            it("registrations") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountRegistrationHistory(stakeAddress: "stake1u9a3t4rgddm4expj0ucyxhxg3ft9ugk2ry6r9w69h04ea6cfj887f") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        for x in r {
                            expect(x.action).to(beAKindOf(AccountRegistrationContent.Action.self))
                            expect(x.txHash).to(beAKindOf(String.self))
                        }
                        done()
                    }
                }
            }

            it("withdrawals") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountWithdrawalHistory(stakeAddress: "stake1u88xakeptjw9jwsytkjal76d07an4thvvrfx3w2kt77pw4sc5rr8k", count: 4, page: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        let expRes = [
                            AccountWithdrawalContent(txHash: "4c8f16ba4730fe0e84d1d79b38a6198b0283b0b87e36388cb3e6c5f07f99bfb0", amount: "1862857028"),
                            AccountWithdrawalContent(txHash: "6072dc5a1688418f0da70427b32c49fb6c494170c7988a105ccc33a95a1b0370", amount: "1779916664"),
                            AccountWithdrawalContent(txHash: "3926bcc6b726394dee99c681d0768849214ca0b02f728690fcafba6c22c3e19c", amount: "821097437"),
                            AccountWithdrawalContent(txHash: "3a277898a5789c433f556672903b3bf260d074efadaf1f0128c4de663a501192", amount: "3602325039"),
                        ]
                        expect(r).to(equal(expRes))
                        done()
                    }
                }
            }

            it("MIRs") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountMirHistory(stakeAddress: "stake1uyq7039vutuw8v7femqtktdu9zlhnqh3mkvvhdazft9ga2q8zdfkp", count: 1, page: 1) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        let expRes = [
                            AccountMirContent(txHash: "7b57f2cf1c442c563647ab29669c88b9116c2668d31d42526ff27ed614da1252", amount: "19296735"),
                        ]
                        expect(r).to(equal(expRes))
                        done()
                    }
                }
            }

            it("addresses") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountAddresses(stakeAddress: "stake1u9a3t4rgddm4expj0ucyxhxg3ft9ugk2ry6r9w69h04ea6cfj887f") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        for x in r {
                            expect(x.address).to(beAKindOf(String.self))
                        }
                        done()
                    }
                }
            }

            it("assets") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountAssets(stakeAddress: "stake1u9e45fvvd4ujpc0kka0pnx9zqdvh9wl96nsg6sje0f5hmfq45lrja") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        for x in r {
                            expect(x.unit).to(beAKindOf(String.self))
                            expect(x.quantity).to(beAKindOf(String.self))
                        }
                        done()
                    }
                }
            }

            it("assetsAll") {
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountAssetsAll(stakeAddress: "stake1u9e45fvvd4ujpc0kka0pnx9zqdvh9wl96nsg6sje0f5hmfq45lrja") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        for x in r {
                            expect(x.unit).to(beAKindOf(String.self))
                            expect(x.quantity).to(beAKindOf(String.self))
                        }
                        done()
                    }
                }
            }
        }
    }
}
