//
// Script.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class Script: Codable, Hashable {
    public enum ModelType: String, Codable, CaseIterable {
        case timelock
        case plutus
    }

    /** Script hash */
    public var scriptHash: String
    /** Type of the script language */
    public var type: ModelType
    /** The size of the CBOR serialised script, if a Plutus script */
    public var serialisedSize: Int?

    public init(scriptHash: String, type: ModelType, serialisedSize: Int?) {
        self.scriptHash = scriptHash
        self.type = type
        self.serialisedSize = serialisedSize
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case scriptHash = "script_hash"
        case type
        case serialisedSize = "serialised_size"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(scriptHash, forKey: .scriptHash)
        try container.encode(type, forKey: .type)
        try container.encode(serialisedSize, forKey: .serialisedSize)
    }

    public static func == (lhs: Script, rhs: Script) -> Bool {
        lhs.scriptHash == rhs.scriptHash &&
            lhs.type == rhs.type &&
            lhs.serialisedSize == rhs.serialisedSize
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(scriptHash.hashValue)
        hasher.combine(type.hashValue)
        hasher.combine(serialisedSize.hashValue)
    }
}
