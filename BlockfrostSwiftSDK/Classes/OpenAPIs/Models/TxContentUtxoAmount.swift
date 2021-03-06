//
// TxContentUtxoAmount.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

/** The sum of all the UTXO per asset */
public final class TxContentUtxoAmount: Codable, Hashable {
    /** The unit of the value */
    public var unit: String
    /** The quantity of the unit */
    public var quantity: String
    /** The hash of the transaction output datum */
    public var dataHash: String?

    public init(unit: String, quantity: String, dataHash: String? = nil) {
        self.unit = unit
        self.quantity = quantity
        self.dataHash = dataHash
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case unit
        case quantity
        case dataHash = "data_hash"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(unit, forKey: .unit)
        try container.encode(quantity, forKey: .quantity)
        try container.encodeIfPresent(dataHash, forKey: .dataHash)
    }

    public static func == (lhs: TxContentUtxoAmount, rhs: TxContentUtxoAmount) -> Bool {
        lhs.unit == rhs.unit &&
            lhs.quantity == rhs.quantity &&
            lhs.dataHash == rhs.dataHash
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(unit.hashValue)
        hasher.combine(quantity.hashValue)
        hasher.combine(dataHash?.hashValue)
    }
}
