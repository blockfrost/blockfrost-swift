//
// NutlinkAddressTickers.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class NutlinkAddressTickers: Codable, Hashable {
    /** Name of the ticker */
    public var name: String
    /** Number of ticker records */
    public var count: Int
    /** Block height of the latest record */
    public var latestBlock: Int

    public init(name: String, count: Int, latestBlock: Int) {
        self.name = name
        self.count = count
        self.latestBlock = latestBlock
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case count
        case latestBlock = "latest_block"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(count, forKey: .count)
        try container.encode(latestBlock, forKey: .latestBlock)
    }

    public static func == (lhs: NutlinkAddressTickers, rhs: NutlinkAddressTickers) -> Bool {
        lhs.name == rhs.name &&
            lhs.count == rhs.count &&
            lhs.latestBlock == rhs.latestBlock
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name.hashValue)
        hasher.combine(count.hashValue)
        hasher.combine(latestBlock.hashValue)
    }
}
