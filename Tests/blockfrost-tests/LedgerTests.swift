//
//  LedgerTests.swift
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

final class LedgerTests: QuickSpec {
    override func spec() {
        var api: CardanoLedgerAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fail("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoLedgerAPI(config: cfg)
        }

        describe("ledger") {
            it("genesis"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getGenesis { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.activeSlotsCoefficient).to(equal(0.05))
                        expect(r.updateQuorum).to(equal(5))
                        expect(r.maxLovelaceSupply).to(equal("45000000000000000"))
                        expect(r.networkMagic).to(equal(764824073))
                        expect(r.epochLength).to(equal(432000))
                        expect(r.systemStart).to(equal(1506203091))
                        expect(r.slotsPerKesPeriod).to(equal(129600))
                        expect(r.slotLength).to(equal(1))
                        expect(r.maxKesEvolutions).to(equal(62))
                        expect(r.securityParam).to(equal(2160))
                        done()
                    }
                }
            }
        }
    }
}
