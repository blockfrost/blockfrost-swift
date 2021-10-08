import Foundation
import XCTest
import Combine
import Quick
import Nimble
import Mocker
#if canImport(AnyCodable)
import AnyCodable
#endif
@testable import BlockfrostSwiftSDK

final class BasicAPITests: QuickSpec {
    override func spec() {
        var api: CardanoAccountsAPI!
        var cfg: BlockfrostConfig!
        let projectId = "test123456"
        let stakeAddr = "stake1u8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkgs46q0w"

        beforeEach {
            cfg = BlockfrostConfig.mainnetDefault()
            cfg.projectId = projectId
            cfg.urlSessionConfigurationModifier = { urlSessCfg in
                urlSessCfg.protocolClasses = [MockingURLProtocol.self] + (urlSessCfg.protocolClasses ?? [])
            }
        }

        describe("basic") {
            it("load should fail on decoding error"){
                let url = URL(string: cfg.basePath + "/accounts/" + stakeAddr)!
                let mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 200, data: [
                    .get : "{}".data(using: .utf8)!
                ])
                mock.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        switch (resp) {
                        case let .failure(err):
                            expect(err).to(matchError(Swift.DecodingError.self))
                            break;
                        case let .success(r):
                            fail("Should have failed, but returned response: \(r)")
                            break;
                        }
                        done()
                    }
                }
            }

            it("load account decodes valid json"){
                let url = URL(string: cfg.basePath + "/accounts/" + stakeAddr)!
                let mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 200, data: [
                    .get : """
                           {"stake_address":"stake1u8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkgs46q0w","active":true,"active_epoch":74,"controlled_amount":"997825743","rewards_sum":"0","withdrawals_sum":"0","reserves_sum":"0","treasury_sum":"0","withdrawable_amount":"0","pool_id":"pool1u04pst2mwm99zfrz7d9c2waq2alxan2a5e9ct7k8yeqxqqalhqh"}
                           """.data(using: .utf8)!
                ])
                mock.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        switch (resp) {
                        case let .failure(err):
                            fail("Request failed with error: \(err)")
                            break;
                        case let .success(r):
                            expect(r).toNot(beNil())
                            expect(r.stakeAddress).to(equal(stakeAddr))
                            break;
                        }
                        done()
                    }
                }
            }

            it("load account invalid address"){
                let url = URL(string: cfg.basePath + "/accounts/" + stakeAddr)!
                let mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 400, data: [
                    .get : """
                           {"status_code": 400, "error": "Invalid address", "message": "address is invalid"}
                           """.data(using: .utf8)!
                ])
                mock.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        switch (resp) {
                        case let .failure(err):
                            expect(err).to(matchError(BlockfrostSwiftSDK.ErrorResponse.self))
                            if case .errorStatus(let code, let status, _, _) = (err as! BlockfrostSwiftSDK.ErrorResponse) {
                                expect(code).to(equal(400))
                                expect(status.statusCode).to(equal(400))
                            } else {
                                fail("Request failed with error: \(err)")
                            }
                            break;
                        case let .success(r):
                            fail("Should have failed, but returned response: \(r)")
                            break;
                        }
                        done()
                    }
                }
            }

            it("check product_id"){
                let url = URL(string: cfg.basePath + "/accounts/" + stakeAddr)!
                var mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 403, data: [
                    .get : """
                           {"status_code": 400, "error": "Invalid address", "message": "address is invalid"}
                           """.data(using: .utf8)!
                ])

                mock.onRequest = { (_ request: URLRequest, _ httpBodyArguments: [String: Any]?) in
                    let pid = request.headers.value(for: "project_id")
                    expect(pid).toNot(beNil())
                    expect(pid).to(equal(projectId))
                }
                mock.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        done()
                    }
                }
            }

            it("nutlink parse"){
                let url = URL(string: cfg.basePath + "/nutlink/tickers/ADAUSD")!
                let mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 200, data: [
                    .get : """
                           [{"address":"addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t","tx_hash":"473a6f5ef23c8f9ea10e6d17372ee90031f44273fb2be6700673269bdd04eb19","block_height":4925385,"tx_index":0,"payload":[{"value":"0.107006","source":"coinGecko"},{"value":"0.10698550057606343","source":"ergoOracles"}]},{"address":"addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t","tx_hash":"4117841140cb0c7ca5c2bd820a3e448806ec3588e99043230fac52a40509bccb","block_height":4925582,"tx_index":2,"payload":[{"value":"0.10671","source":"coinGecko"},{"value":"0.10618100888947407","source":"ergoOracles"}]}]
                           """.data(using: .utf8)!
                ])
                mock.register()

                let napi = NutLinkAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = napi.getTickerRecordsByTicker(ticker: "ADAUSD") { resp in
                        switch (resp) {
                        case let .failure(err):
                            fail("Request failed with error: \(err)")
                            break;
                        case let .success(r):
                            expect(r).toNot(beNil())
                            expect(r).toNot(beNil())
                            expect(r).toNot(beEmpty())
                            expect(r).to(haveCount(2))

                            expect(r[0].address).to(equal("addr1q85yx2w7ragn5sx6umgmtjpc3865s9sg59sz4rrh6f90kgwfwlzu3w8ttacqg89mkdgwshwnplj5c5n9f8dhp0h55q2q7qm63t"))
                            expect(r[0].txHash).to(equal("473a6f5ef23c8f9ea10e6d17372ee90031f44273fb2be6700673269bdd04eb19"))
                            expect(r[0].blockHeight).to(equal(4925385))
                            expect(r[0].txIndex).to(equal(0))
                            expect(r[0].payload).toNot(beNil())
                            expect(CodableHelper.eqAny(r[0].payload, [
                                ["value":"0.107006","source":"coinGecko"],
                                ["value":"0.10698550057606343","source":"ergoOracles"]
                            ])).to(beTrue())
                            expect(CodableHelper.eqAny(r[0].payload, [
                                ["value":"0.107005","source":"coinGecko"],
                                ["value":"0.10698550057606343","source":"ergoOracles"]
                            ])).to(beFalse())
                            break;
                        }
                        done()
                    }
                }
            }

            it("load account rate limited"){
                var attemptsMade = 0
                let url = URL(string: cfg.basePath + "/accounts/" + stakeAddr)!
                let mock = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 200, data: [
                    .get : """
                           {"stake_address":"stake1u8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkgs46q0w","active":true,"active_epoch":74,"controlled_amount":"997825743","rewards_sum":"0","withdrawals_sum":"0","reserves_sum":"0","treasury_sum":"0","withdrawable_amount":"0","pool_id":"pool1u04pst2mwm99zfrz7d9c2waq2alxan2a5e9ct7k8yeqxqqalhqh"}
                           """.data(using: .utf8)!
                ])
                var mockRl = Mock(url: url, ignoreQuery: true, dataType: .json, statusCode: 429, data: [
                    .get : """
                           {"status_code": 429, "error": "Rate limited", "message": "Slow down bro"}
                           """.data(using: .utf8)!
                ])
                mockRl.onRequest = { req, params in
                    if attemptsMade + 1 >= cfg.retryPolicy!.retryLimit {
                        mock.register()
                    }
                    attemptsMade += 1
                }
                mockRl.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        switch (resp) {
                        case let .failure(err):
                            fail("Request failed with error: \(err)")
                            break;
                        case let .success(r):
                            expect(r).toNot(beNil())
                            expect(r.stakeAddress).to(equal(stakeAddr))
                            break;
                        }
                        done()
                    }
                }

                // And now fail rate limiter, increase number of retry calls needed by one
                attemptsMade = 0
                mockRl.onRequest = { req, params in
                    if attemptsMade >= cfg.retryPolicy!.retryLimit {
                        mock.register()
                    }
                    attemptsMade += 1
                }
                mockRl.register()

                api = CardanoAccountsAPI(config: cfg)
                waitUntil(timeout: 10) { done in
                    let _ = api.getAccountByStakeAddress(stakeAddress: stakeAddr) { resp in
                        switch (resp) {
                        case let .failure(err):
                            expect(err).to(matchError(BlockfrostSwiftSDK.ErrorResponse.self))
                            if case .errorStatus(let code, let status, _, _) = (err as! BlockfrostSwiftSDK.ErrorResponse) {
                                expect(code).to(equal(429))
                                expect(status.statusCode).to(equal(429))
                            } else {
                                fail("Request failed with error: \(err)")
                            }
                            break;
                        case let .success(r):
                            fail("Should have failed, but returned response: \(r)")
                            break;
                        }
                        done()
                    }
                }
            }


        }
    }
}
