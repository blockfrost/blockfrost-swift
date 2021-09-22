//
//  File.swift
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

final class BlockTests: QuickSpec {
    override func spec() {
        var config = BlockfrostConfig()
        var api: CardanoBlocksAPI!

        beforeSuite {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fail("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            config = cfg!
            api = CardanoBlocksAPI(config: cfg)
        }

        beforeEach {
            api = CardanoBlocksAPI(config: config)
        }

        it("testNextBlocks_willLoadSinglePage") {
            waitUntil(timeout: 3) { done in
                let _ = api.getNextBlocks(hashOrNumber: "2828500") { resp in
                    guard let r = TestUtils.getResult(resp: resp) else {
                        done(); return;
                    }

                    expect(r).toNot(beEmpty())
                    expect(r[0].height).to(equal(2828501))
                    expect(r[0].time).to(equal(1562803711))
                    expect(r[0].slot).to(equal(2830031))
                    expect(r[0].epoch).to(equal(131))
                    expect(r[0].epochSlot).to(equal(431))
                    expect(r[0].hash).to(equal("cf1ef63c5655e1f883f1d3f7a79adc0823434c2a394ed7436e58412a75ed8d01"))
                    expect(r[0].size).to(equal(1575))
                    expect(r[0].txCount).to(equal(2))
                    expect(r[0].fees).to(equal("352996"))
                    expect(r[0].output).to(equal("2772474536329"))
                    expect(r[0].blockVrf).to(beNil())
                    expect(r[0].previousBlock).to(equal("89ee431a3591ea083a4d2c0c29e2f0569a2a63680fbe7fb5ecc4cd53254dcac2"))
                    expect(r[0].nextBlock).to(equal("ea4142ae8425eb68bbeaed133f5b80f697d80a56b32fa4f506a1db69c6fd73c5"))
                    expect(r[1].hash).to(equal("ea4142ae8425eb68bbeaed133f5b80f697d80a56b32fa4f506a1db69c6fd73c5"))
                    expect(r[10].fees).to(beNil())
                    expect(r[10].output).to(beNil())
                    done()
                }
            }
        }
    }
}
