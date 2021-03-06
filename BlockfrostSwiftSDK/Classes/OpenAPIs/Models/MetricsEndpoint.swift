//
// MetricsEndpoint.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class MetricsEndpoint: Codable, Hashable {
    /** Starting time of the call count interval (ends midnight UTC) in UNIX time */
    public var time: Int
    /** Sum of all calls for a particular day and endpoint */
    public var calls: Int
    /** Endpoint parent name */
    public var endpoint: String

    public init(time: Int, calls: Int, endpoint: String) {
        self.time = time
        self.calls = calls
        self.endpoint = endpoint
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case time
        case calls
        case endpoint
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(calls, forKey: .calls)
        try container.encode(endpoint, forKey: .endpoint)
    }

    public static func == (lhs: MetricsEndpoint, rhs: MetricsEndpoint) -> Bool {
        lhs.time == rhs.time &&
            lhs.calls == rhs.calls &&
            lhs.endpoint == rhs.endpoint
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(time.hashValue)
        hasher.combine(calls.hashValue)
        hasher.combine(endpoint.hashValue)
    }
}
