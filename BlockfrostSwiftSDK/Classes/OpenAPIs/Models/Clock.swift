//
// InlineResponse2002.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Clock: Codable, Hashable {

    public var serverTime: Int64

    public init(serverTime: Int64) {
        self.serverTime = serverTime
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case serverTime = "server_time"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(serverTime, forKey: .serverTime)
    }
}

