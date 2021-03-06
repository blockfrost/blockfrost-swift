//
// BlockContent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class BlockContent: Codable, Hashable {
    /** Block creation time in UNIX time */
    public var time: Int
    /** Block number */
    public var height: Int?
    /** Hash of the block */
    public var hash: String
    /** Slot number */
    public var slot: Int?
    /** Epoch number */
    public var epoch: Int?
    /** Slot within the epoch */
    public var epochSlot: Int?
    /** Bech32 ID of the slot leader or specific block description in case there is no slot leader */
    public var slotLeader: String
    /** Block size in Bytes */
    public var size: Int
    /** Number of transactions in the block */
    public var txCount: Int
    /** Total output within the block in Lovelaces */
    public var output: String?
    /** Total fees within the block in Lovelaces */
    public var fees: String?
    /** VRF key of the block */
    public var blockVrf: String?
    /** Hash of the previous block */
    public var previousBlock: String?
    /** Hash of the next block */
    public var nextBlock: String?
    /** Number of block confirmations */
    public var confirmations: Int

    public init(time: Int, height: Int?, hash: String, slot: Int?, epoch: Int?, epochSlot: Int?, slotLeader: String, size: Int, txCount: Int, output: String?, fees: String?, blockVrf: String?, previousBlock: String?, nextBlock: String?, confirmations: Int) {
        self.time = time
        self.height = height
        self.hash = hash
        self.slot = slot
        self.epoch = epoch
        self.epochSlot = epochSlot
        self.slotLeader = slotLeader
        self.size = size
        self.txCount = txCount
        self.output = output
        self.fees = fees
        self.blockVrf = blockVrf
        self.previousBlock = previousBlock
        self.nextBlock = nextBlock
        self.confirmations = confirmations
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case time
        case height
        case hash
        case slot
        case epoch
        case epochSlot = "epoch_slot"
        case slotLeader = "slot_leader"
        case size
        case txCount = "tx_count"
        case output
        case fees
        case blockVrf = "block_vrf"
        case previousBlock = "previous_block"
        case nextBlock = "next_block"
        case confirmations
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(height, forKey: .height)
        try container.encode(hash, forKey: .hash)
        try container.encode(slot, forKey: .slot)
        try container.encode(epoch, forKey: .epoch)
        try container.encode(epochSlot, forKey: .epochSlot)
        try container.encode(slotLeader, forKey: .slotLeader)
        try container.encode(size, forKey: .size)
        try container.encode(txCount, forKey: .txCount)
        try container.encode(output, forKey: .output)
        try container.encode(fees, forKey: .fees)
        try container.encode(blockVrf, forKey: .blockVrf)
        try container.encode(previousBlock, forKey: .previousBlock)
        try container.encode(nextBlock, forKey: .nextBlock)
        try container.encode(confirmations, forKey: .confirmations)
    }

    public static func == (lhs: BlockContent, rhs: BlockContent) -> Bool {
        lhs.time == rhs.time &&
            lhs.height == rhs.height &&
            lhs.hash == rhs.hash &&
            lhs.slot == rhs.slot &&
            lhs.epoch == rhs.epoch &&
            lhs.epochSlot == rhs.epochSlot &&
            lhs.slotLeader == rhs.slotLeader &&
            lhs.size == rhs.size &&
            lhs.txCount == rhs.txCount &&
            lhs.output == rhs.output &&
            lhs.fees == rhs.fees &&
            lhs.blockVrf == rhs.blockVrf &&
            lhs.previousBlock == rhs.previousBlock &&
            lhs.nextBlock == rhs.nextBlock &&
            lhs.confirmations == rhs.confirmations
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(time.hashValue)
        hasher.combine(height.hashValue)
        hasher.combine(hash.hashValue)
        hasher.combine(slot.hashValue)
        hasher.combine(epoch.hashValue)
        hasher.combine(epochSlot.hashValue)
        hasher.combine(slotLeader.hashValue)
        hasher.combine(size.hashValue)
        hasher.combine(txCount.hashValue)
        hasher.combine(output.hashValue)
        hasher.combine(fees.hashValue)
        hasher.combine(blockVrf.hashValue)
        hasher.combine(previousBlock.hashValue)
        hasher.combine(nextBlock.hashValue)
        hasher.combine(confirmations.hashValue)
    }
}
