//
//  NetworkTests.swift
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

final class NetworkTests: QuickSpec {
    override func spec() {
        var api: CardanoNetworkAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoNetworkAPI(config: cfg)
        }

        describe("network") {
            it("get"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getNetwork { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.stake).toNot(beNil())
                        expect(r.supply).toNot(beNil())
                        done()
                    }
                }
            }
        }
    }
}
