//
// AssetTransaction.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class AssetTransaction: Codable, Hashable {
    /** Hash of the transaction */
    public var txHash: String
    /** Transaction index within the block */
    public var txIndex: Int
    /** Block height */
    public var blockHeight: Int

    public init(txHash: String, txIndex: Int, blockHeight: Int) {
        self.txHash = txHash
        self.txIndex = txIndex
        self.blockHeight = blockHeight
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case txHash = "tx_hash"
        case txIndex = "tx_index"
        case blockHeight = "block_height"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(txHash, forKey: .txHash)
        try container.encode(txIndex, forKey: .txIndex)
        try container.encode(blockHeight, forKey: .blockHeight)
    }

    public static func == (lhs: AssetTransaction, rhs: AssetTransaction) -> Bool {
        lhs.txHash == rhs.txHash &&
            lhs.txIndex == rhs.txIndex &&
            lhs.blockHeight == rhs.blockHeight
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(txHash.hashValue)
        hasher.combine(txIndex.hashValue)
        hasher.combine(blockHeight.hashValue)
    }
}