//
//  NutlinkTests.swift
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

final class NutlinkTests: QuickSpec {
    override func spec() {
        var api: NutLinkAPI!

        beforeEach {
            let cfg = TestUtils.initConfig()
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_PROJECT_ID")
            }
            api = NutLinkAPI(config: cfg)
        }

        describe("nutlink") {
            it("address"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getAddress(address: "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).to(equal(
                                NutlinkAddress(
                                        address: "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t",
                                        metadataUrl: "https://nut.link/metadata.json",
                                        metadataHash: "9586368825d39caf48bc64b2ca8a8db7bffa9227a5dad8464ce499be4516498f",
                                        metadata: [
                                            "ticker": "NUTS",
                                            "name": "StakeNuts.com",
                                            "description": "StakeNuts nut.link oracle pool",
                                            "homepage": "https://stakenuts.com",
                                            "address":
                                            "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t"
                                        ])
                        ))
                        done()
                    }
                }
            }

            it("addressTickers"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getAddressTickers(address: "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t", count: 3) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(3))
                        expect(r[0].name).to(equal("ADABTC"))
                        expect(r[1].name).to(equal("ADACAD"))
                        expect(r[2].name).to(equal("ADAEUR"))

                        done()
                    }
                }
            }

            it("addressTickersAll"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getAddressTickersAll(address: "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t") { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        done()
                    }
                }
            }

            it("addressTickersByTicker_page2count2"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTickerRecordsByAddressAndTicker(
                            address: "addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t",
                            ticker: "ADAUSD", count: 2, page: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }
                        
                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(2))
                        expect(r[0].txHash).to(equal("1abe80dc1f101ff3b76659d32b532d53b21d76c98cfce0c0c3c45957680c54ff"))
                        expect(r[0].blockHeight).to(equal(4925818))
                        expect(r[0].txIndex).to(equal(1))
                        expect(r[0].payload).toNot(beNil())
                        expect(r[0].payload).to(equal([
                            [ "value": "0.10547", "source": "coinGecko" ],
                            [ "value": "0.10663800237162917", "source": "ergoOracles" ],
                        ]))

                        expect(r[1].txHash).to(equal("b8cc8d75ca200555ca4efdf79599a06300c2a28ffbaa82fd23f22c8f95967bf9"))
                        expect(r[1].blockHeight).to(equal(4925982))
                        expect(r[1].txIndex).to(equal(1))
                        expect(r[1].payload).toNot(beNil())
                        expect(r[1].payload).to(equal([
                            [ "value": "0.106359", "source": "coinGecko" ],
                            [ "value": "0.10575249137006794", "source": "ergoOracles" ],
                        ]))

                        done()
                    }
                }
            }

            it("tickers_page2_count2"){
                waitUntil(timeout: 3) { done in
                    let _ = api.getTickerRecordsByTicker(ticker: "ADAUSD", count: 2, page: 2) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(haveCount(2))

                        expect(r[0].address).to(equal("addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t"))
                        expect(r[0].txHash).to(equal("1abe80dc1f101ff3b76659d32b532d53b21d76c98cfce0c0c3c45957680c54ff"))
                        expect(r[0].blockHeight).to(equal(4925818))
                        expect(r[0].txIndex).to(equal(1))
                        expect(r[0].payload).toNot(beNil())
                        expect(r[0].payload).to(equal([
                            [ "value": "0.10547", "source": "coinGecko" ],
                            [ "value": "0.10663800237162917", "source": "ergoOracles" ],
                        ]))

                        expect(r[1].address).to(equal("addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t"))
                        expect(r[1].txHash).to(equal("b8cc8d75ca200555ca4efdf79599a06300c2a28ffbaa82fd23f22c8f95967bf9"))
                        expect(r[1].blockHeight).to(equal(4925982))
                        expect(r[1].txIndex).to(equal(1))
                        expect(r[1].payload).toNot(beNil())
                        expect(r[1].payload).to(equal([
                            [ "value": "0.106359", "source": "coinGecko" ],
                            [ "value": "0.10575249137006794", "source": "ergoOracles" ],
                        ]))

                        done()
                    }
                }
            }

        }
    }
}
