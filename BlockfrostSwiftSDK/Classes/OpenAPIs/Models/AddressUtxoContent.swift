//
// AddressUtxoContent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class AddressUtxoContent: Codable, Hashable {
    /** Transaction hash of the UTXO */
    public var txHash: String
    /** UTXO index in the transaction */
    @available(*, deprecated, message: "This property is deprecated.")
    public var txIndex: Int
    /** UTXO index in the transaction */
    public var outputIndex: Int
    public var amount: [AnyCodable]
    /** Block hash of the UTXO */
    public var block: String
    /** The hash of the transaction output datum */
    public var dataHash: String?

    public init(txHash: String, txIndex: Int, outputIndex: Int, amount: [AnyCodable], block: String, dataHash: String?) {
        self.txHash = txHash
        self.txIndex = txIndex
        self.outputIndex = outputIndex
        self.amount = amount
        self.block = block
        self.dataHash = dataHash
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case txHash = "tx_hash"
        case txIndex = "tx_index"
        case outputIndex = "output_index"
        case amount
        case block
        case dataHash = "data_hash"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(txHash, forKey: .txHash)
        try container.encode(txIndex, forKey: .txIndex)
        try container.encode(outputIndex, forKey: .outputIndex)
        try container.encode(amount, forKey: .amount)
        try container.encode(block, forKey: .block)
        try container.encode(dataHash, forKey: .dataHash)
    }

    public static func == (lhs: AddressUtxoContent, rhs: AddressUtxoContent) -> Bool {
        lhs.txHash == rhs.txHash &&
            lhs.txIndex == rhs.txIndex &&
            lhs.outputIndex == rhs.outputIndex &&
            lhs.amount == rhs.amount &&
            lhs.block == rhs.block &&
            lhs.dataHash == rhs.dataHash
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(txHash.hashValue)
        hasher.combine(txIndex.hashValue)
        hasher.combine(outputIndex.hashValue)
        hasher.combine(amount.hashValue)
        hasher.combine(block.hashValue)
        hasher.combine(dataHash.hashValue)
    }
}
