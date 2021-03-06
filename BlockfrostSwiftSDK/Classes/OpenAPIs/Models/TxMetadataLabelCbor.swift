//
// TxMetadataLabelCbor.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class TxMetadataLabelCbor: Codable, Hashable {
    /** Transaction hash that contains the specific metadata */
    public var txHash: String
    /** Content of the CBOR metadata */
    public var cborMetadata: String?

    public init(txHash: String, cborMetadata: String?) {
        self.txHash = txHash
        self.cborMetadata = cborMetadata
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case txHash = "tx_hash"
        case cborMetadata = "cbor_metadata"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(txHash, forKey: .txHash)
        try container.encode(cborMetadata, forKey: .cborMetadata)
    }

    public static func == (lhs: TxMetadataLabelCbor, rhs: TxMetadataLabelCbor) -> Bool {
        lhs.txHash == rhs.txHash &&
            lhs.cborMetadata == rhs.cborMetadata
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(txHash.hashValue)
        hasher.combine(cborMetadata.hashValue)
    }
}
