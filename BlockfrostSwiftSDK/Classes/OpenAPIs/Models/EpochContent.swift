//
// EpochContent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class EpochContent: Codable, Hashable {
    /** Epoch number */
    public var epoch: Int
    /** Unix time of the start of the epoch */
    public var startTime: Int
    /** Unix time of the end of the epoch */
    public var endTime: Int
    /** Unix time of the first block of the epoch */
    public var firstBlockTime: Int
    /** Unix time of the last block of the epoch */
    public var lastBlockTime: Int
    /** Number of blocks within the epoch */
    public var blockCount: Int
    /** Number of transactions within the epoch */
    public var txCount: Int
    /** Sum of all the transactions within the epoch in Lovelaces */
    public var output: String
    /** Sum of all the fees within the epoch in Lovelaces */
    public var fees: String
    /** Sum of all the active stakes within the epoch in Lovelaces */
    public var activeStake: String?

    public init(epoch: Int, startTime: Int, endTime: Int, firstBlockTime: Int, lastBlockTime: Int, blockCount: Int, txCount: Int, output: String, fees: String, activeStake: String?) {
        self.epoch = epoch
        self.startTime = startTime
        self.endTime = endTime
        self.firstBlockTime = firstBlockTime
        self.lastBlockTime = lastBlockTime
        self.blockCount = blockCount
        self.txCount = txCount
        self.output = output
        self.fees = fees
        self.activeStake = activeStake
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case epoch
        case startTime = "start_time"
        case endTime = "end_time"
        case firstBlockTime = "first_block_time"
        case lastBlockTime = "last_block_time"
        case blockCount = "block_count"
        case txCount = "tx_count"
        case output
        case fees
        case activeStake = "active_stake"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(epoch, forKey: .epoch)
        try container.encode(startTime, forKey: .startTime)
        try container.encode(endTime, forKey: .endTime)
        try container.encode(firstBlockTime, forKey: .firstBlockTime)
        try container.encode(lastBlockTime, forKey: .lastBlockTime)
        try container.encode(blockCount, forKey: .blockCount)
        try container.encode(txCount, forKey: .txCount)
        try container.encode(output, forKey: .output)
        try container.encode(fees, forKey: .fees)
        try container.encode(activeStake, forKey: .activeStake)
    }

    public static func == (lhs: EpochContent, rhs: EpochContent) -> Bool {
        lhs.epoch == rhs.epoch &&
            lhs.startTime == rhs.startTime &&
            lhs.endTime == rhs.endTime &&
            lhs.firstBlockTime == rhs.firstBlockTime &&
            lhs.lastBlockTime == rhs.lastBlockTime &&
            lhs.blockCount == rhs.blockCount &&
            lhs.txCount == rhs.txCount &&
            lhs.output == rhs.output &&
            lhs.fees == rhs.fees &&
            lhs.activeStake == rhs.activeStake
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(epoch.hashValue)
        hasher.combine(startTime.hashValue)
        hasher.combine(endTime.hashValue)
        hasher.combine(firstBlockTime.hashValue)
        hasher.combine(lastBlockTime.hashValue)
        hasher.combine(blockCount.hashValue)
        hasher.combine(txCount.hashValue)
        hasher.combine(output.hashValue)
        hasher.combine(fees.hashValue)
        hasher.combine(activeStake.hashValue)
    }
}
