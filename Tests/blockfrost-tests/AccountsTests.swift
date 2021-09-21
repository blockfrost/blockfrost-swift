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
        describe("accounts") {
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
                    let _ = api.getAccountByStakeAddress(stakeAddress: "stake_test1upwlsqc3m9629dsf2vw3ycuqv5jhd023xtjh3ax42nvj03gwy2cha") { resp in
                        switch (resp) {
                        case let .failure(err):
                            fail("Request failed with error: \(err)")
                            break
                        case let .success(r):
                            expect(r).toNot(beNil())
                            expect(r.stakeAddress).to(equal("stake_test1upwlsqc3m9629dsf2vw3ycuqv5jhd023xtjh3ax42nvj03gwy2cha"))
                            expect(r.active).to(beAKindOf(Bool.self))
                            expect(r.activeEpoch).to(beAKindOf(Int.self))
                            expect(r.controlledAmount).to(beAKindOf(String.self))
                            expect(r.rewardsSum).to(beAKindOf(String.self))
                            expect(r.reservesSum).to(beAKindOf(String.self))
                            expect(r.treasurySum).to(beAKindOf(String.self))
                            expect(r.withdrawableAmount).to(beAKindOf(String.self))
                            expect(r.poolId).to(beAKindOf(String.self))
                            break
                        }
                        done()
                    }
                }
            }
        }
    }
}
