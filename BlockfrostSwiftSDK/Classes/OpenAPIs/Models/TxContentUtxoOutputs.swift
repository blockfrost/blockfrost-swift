//
// TxContentUtxoOutputs.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class TxContentUtxoOutputs: Codable, Hashable {
    /** Output address */
    public var address: String
    public var amount: [TxContentUtxoAmount]

    public init(address: String, amount: [TxContentUtxoAmount]) {
        self.address = address
        self.amount = amount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case amount
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(address, forKey: .address)
        try container.encode(amount, forKey: .amount)
    }

    public static func == (lhs: TxContentUtxoOutputs, rhs: TxContentUtxoOutputs) -> Bool {
        lhs.address == rhs.address &&
            lhs.amount == rhs.amount
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(address.hashValue)
        hasher.combine(amount.hashValue)
    }
}
