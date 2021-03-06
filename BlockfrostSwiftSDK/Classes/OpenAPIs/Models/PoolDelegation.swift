//
// PoolDelegation.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class PoolDelegation: Codable, Hashable {
    /** Transaction ID */
    public var txHash: String
    /** Certificate within the transaction */
    public var certIndex: Int

    public init(txHash: String, certIndex: Int) {
        self.txHash = txHash
        self.certIndex = certIndex
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case txHash = "tx_hash"
        case certIndex = "cert_index"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(txHash, forKey: .txHash)
        try container.encode(certIndex, forKey: .certIndex)
    }

    public static func == (lhs: PoolDelegation, rhs: PoolDelegation) -> Bool {
        lhs.txHash == rhs.txHash &&
            lhs.certIndex == rhs.certIndex
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(txHash.hashValue)
        hasher.combine(certIndex.hashValue)
    }
}
