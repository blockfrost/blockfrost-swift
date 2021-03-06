//
// PoolHistory.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class PoolHistory: Codable, Hashable {
    /** Epoch number */
    public var epoch: Int
    /** Number of blocks created by pool */
    public var blocks: Int
    /** Active (Snapshot of live stake 2 epochs ago) stake in Lovelaces */
    public var activeStake: String
    /** Pool size (percentage) of overall active stake at that epoch */
    public var activeSize: Double
    /** Number of delegators for epoch */
    public var delegatorsCount: Int
    /** Total rewards received before distribution to delegators */
    public var rewards: String
    /** Pool operator rewards */
    public var fees: String

    public init(epoch: Int, blocks: Int, activeStake: String, activeSize: Double, delegatorsCount: Int, rewards: String, fees: String) {
        self.epoch = epoch
        self.blocks = blocks
        self.activeStake = activeStake
        self.activeSize = activeSize
        self.delegatorsCount = delegatorsCount
        self.rewards = rewards
        self.fees = fees
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case epoch
        case blocks
        case activeStake = "active_stake"
        case activeSize = "active_size"
        case delegatorsCount = "delegators_count"
        case rewards
        case fees
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(epoch, forKey: .epoch)
        try container.encode(blocks, forKey: .blocks)
        try container.encode(activeStake, forKey: .activeStake)
        try container.encode(activeSize, forKey: .activeSize)
        try container.encode(delegatorsCount, forKey: .delegatorsCount)
        try container.encode(rewards, forKey: .rewards)
        try container.encode(fees, forKey: .fees)
    }

    public static func == (lhs: PoolHistory, rhs: PoolHistory) -> Bool {
        lhs.epoch == rhs.epoch &&
            lhs.blocks == rhs.blocks &&
            lhs.activeStake == rhs.activeStake &&
            lhs.activeSize == rhs.activeSize &&
            lhs.delegatorsCount == rhs.delegatorsCount &&
            lhs.rewards == rhs.rewards &&
            lhs.fees == rhs.fees
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(epoch.hashValue)
        hasher.combine(blocks.hashValue)
        hasher.combine(activeStake.hashValue)
        hasher.combine(activeSize.hashValue)
        hasher.combine(delegatorsCount.hashValue)
        hasher.combine(rewards.hashValue)
        hasher.combine(fees.hashValue)
    }
}
