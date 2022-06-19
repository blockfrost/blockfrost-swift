//
//  PoolsTests.swift
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

final class ScriptsTests: QuickSpec {
    override func spec() {
        var api: CardanoScriptsAPI!
        var scriptHash: String!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = CardanoScriptsAPI(config: cfg)
        }

        describe("scripts") {
            it("all"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getScripts(count: 10) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        r.forEach { it in expect(it).toNot(beNil()) }
                        scriptHash = r[0].scriptHash
                        done()
                    }
                }
            }

            it("byHash"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getScript(scriptHash: scriptHash) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        done()
                    }
                }
            }

            it("redeemers"){
                waitUntil(timeout: TestConsts.TIMEOUT) { done in
                    let _ = api.getScriptRedeemers(scriptHash: scriptHash) { resp in
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
