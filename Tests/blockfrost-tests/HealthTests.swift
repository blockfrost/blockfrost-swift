//
//  HealthTests.swift
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

final class HealthTests: QuickSpec {
    override func spec() {
        var api: HealthAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = HealthAPI(config: cfg)
        }

        describe("health") {
            it("root"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getApiRoot { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.url).to(equal("https://blockfrost.io/"))
                        done()
                    }
                }
            }

            it("getHealth"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getHealth { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.isHealthy).to(beTrue())
                        done()
                    }
                }
            }

            it("getClock"){
                waitUntil(timeout: 10) { done in
                    let _ = api.getCurrentBackendTime { resp in
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
