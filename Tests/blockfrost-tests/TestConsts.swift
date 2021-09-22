//
//  File.swift
//  
//
//  Created by Dusan Klinec on 15.09.2021.
//

import Foundation
public struct TestConsts {
    public static let TESTNET_URL = "https://cardano-testnet.blockfrost.io/api/v0/"
    public static let MAINNET_URL = "https://cardano-mainnet.blockfrost.io/api/v0/"
    public static let IS_TESTNET = false
    public static let TEST_URL = IS_TESTNET ? TESTNET_URL : MAINNET_URL
}
