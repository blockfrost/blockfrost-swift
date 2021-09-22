//
//  IPFSTests.swift
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

final class IPFSTests: QuickSpec {
    override func spec() {
        var apiAdd: IPFSAddAPI!
        var apiPin: IPFSPinsAPI!

        beforeEach {
            let cfg = TestUtils.initConfig(ipfs: true)
            if cfg == nil {
                fatalError("Project ID is not defined, use env var BF_IPFS_PROJECT_ID")
            }
            apiAdd = IPFSAddAPI(config: cfg)
            apiPin = IPFSPinsAPI(config: cfg)
        }

        describe("ipfs-add") {
            it("flow"){
                let bundle = Bundle.module //  Bundle(for: type(of: self)) Bundle(for: Self.self)
                guard let path = bundle.path(forResource: "img", ofType: "svg") else {
                    fatalError("Could not load img path")
                }
                let fileUrl = URL(fileURLWithPath: path)
                var ipfsHash: String!

                waitUntil(timeout: 10) { done in
                    let _ = apiAdd.add(file: fileUrl) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.ipfsHash).to(equal("QmUCXMTcvuJpwHF3gABRr69ceQR2uEG2Fsik9CyWh8MUoQ"))
                        expect(r.name).to(equal("img.svg"))
                        expect(r.size).to(equal("5617"))
                        ipfsHash = r.ipfsHash
                        done()
                    }
                }

                waitUntil(timeout: 10) { done in
                    let _ = apiPin.pinAdd(iPFSPath: ipfsHash) { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r.ipfsHash).to(equal("QmUCXMTcvuJpwHF3gABRr69ceQR2uEG2Fsik9CyWh8MUoQ"))
                        done()
                    }
                }

                waitUntil(timeout: 10) { done in
                    let _ = apiPin.getPinList { resp in
                        guard let r = TestUtils.getResult(resp: resp) else {
                            done(); return;
                        }

                        expect(r).toNot(beNil())
                        expect(r).toNot(beEmpty())
                        expect(r).to(containElementSatisfying { el in el.ipfsHash == "QmUCXMTcvuJpwHF3gABRr69ceQR2uEG2Fsik9CyWh8MUoQ" })
                        done()
                    }
                }
                
            }
        }
    }
}
