//
//  File.swift
//  
//
//  Created by Dusan Klinec on 15.09.2021.
//

import Foundation
import BlockfrostSwiftSDK

public struct TestConsts {
    public static let TESTNET_URL = BlockfrostConfig.URL_TESTNET
    public static let MAINNET_URL = BlockfrostConfig.URL_MAINNET
    public static let IPFS_URL = BlockfrostConfig.URL_IPFS
    public static let IS_TESTNET = false
    public static let TEST_URL = IS_TESTNET ? TESTNET_URL : MAINNET_URL
}
