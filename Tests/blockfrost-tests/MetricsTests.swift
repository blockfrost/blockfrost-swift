//
//  MetricsTests.swift
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

final class MetricsTests: QuickSpec {
    override func spec() {
        var api: MetricsAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fail("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = MetricsAPI(config: cfg)
        }

        describe("metrics") {
            it("get"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getMetrics { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("endpoints"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getMetricsEndpoints { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

        }
    }
}
