//
// TxContentMetadata.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class TxContentMetadata: Codable, Hashable {
    /** Metadata label */
    public var label: String
    /** Content of the metadata */
    public var jsonMetadata: [String:AnyCodable]

    public init(label: String, jsonMetadata: [String:AnyCodable]) {
        self.label = label
        self.jsonMetadata = jsonMetadata
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case label
        case jsonMetadata = "json_metadata"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(label, forKey: .label)
        try container.encode(jsonMetadata, forKey: .jsonMetadata)
    }

    public static func == (lhs: TxContentMetadata, rhs: TxContentMetadata) -> Bool {
        lhs.label == rhs.label &&
            CodableHelper.codableHashEqual(lhs.jsonMetadata, rhs.jsonMetadata) &&
            CodableHelper.codableDeepEqual(lhs.jsonMetadata, rhs.jsonMetadata)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(label.hashValue)
        hasher.combine(jsonMetadata.hashValue)
    }
}
