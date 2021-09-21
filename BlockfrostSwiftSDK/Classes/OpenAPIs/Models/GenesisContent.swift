//
// GenesisContent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class GenesisContent: Codable, Hashable {
    /** The proportion of slots in which blocks should be issued */
    public var activeSlotsCoefficient: Double
    /** Determines the quorum needed for votes on the protocol parameter updates */
    public var updateQuorum: Int
    /** The total number of lovelace in the system */
    public var maxLovelaceSupply: String
    /** Network identifier */
    public var networkMagic: Int
    /** Number of slots in an epoch */
    public var epochLength: Int
    /** Time of slot 0 in UNIX time */
    public var systemStart: Int
    /** Number of slots in an KES period */
    public var slotsPerKesPeriod: Int
    /** Duration of one slot in seconds */
    public var slotLength: Int
    /** The maximum number of time a KES key can be evolved before a pool operator must create a new operational certificate */
    public var maxKesEvolutions: Int
    /** Security parameter k */
    public var securityParam: Int

    public init(activeSlotsCoefficient: Double, updateQuorum: Int, maxLovelaceSupply: String, networkMagic: Int, epochLength: Int, systemStart: Int, slotsPerKesPeriod: Int, slotLength: Int, maxKesEvolutions: Int, securityParam: Int) {
        self.activeSlotsCoefficient = activeSlotsCoefficient
        self.updateQuorum = updateQuorum
        self.maxLovelaceSupply = maxLovelaceSupply
        self.networkMagic = networkMagic
        self.epochLength = epochLength
        self.systemStart = systemStart
        self.slotsPerKesPeriod = slotsPerKesPeriod
        self.slotLength = slotLength
        self.maxKesEvolutions = maxKesEvolutions
        self.securityParam = securityParam
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case activeSlotsCoefficient = "active_slots_coefficient"
        case updateQuorum = "update_quorum"
        case maxLovelaceSupply = "max_lovelace_supply"
        case networkMagic = "network_magic"
        case epochLength = "epoch_length"
        case systemStart = "system_start"
        case slotsPerKesPeriod = "slots_per_kes_period"
        case slotLength = "slot_length"
        case maxKesEvolutions = "max_kes_evolutions"
        case securityParam = "security_param"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(activeSlotsCoefficient, forKey: .activeSlotsCoefficient)
        try container.encode(updateQuorum, forKey: .updateQuorum)
        try container.encode(maxLovelaceSupply, forKey: .maxLovelaceSupply)
        try container.encode(networkMagic, forKey: .networkMagic)
        try container.encode(epochLength, forKey: .epochLength)
        try container.encode(systemStart, forKey: .systemStart)
        try container.encode(slotsPerKesPeriod, forKey: .slotsPerKesPeriod)
        try container.encode(slotLength, forKey: .slotLength)
        try container.encode(maxKesEvolutions, forKey: .maxKesEvolutions)
        try container.encode(securityParam, forKey: .securityParam)
    }

    public static func == (lhs: GenesisContent, rhs: GenesisContent) -> Bool {
        lhs.activeSlotsCoefficient == rhs.activeSlotsCoefficient &&
            lhs.updateQuorum == rhs.updateQuorum &&
            lhs.maxLovelaceSupply == rhs.maxLovelaceSupply &&
            lhs.networkMagic == rhs.networkMagic &&
            lhs.epochLength == rhs.epochLength &&
            lhs.systemStart == rhs.systemStart &&
            lhs.slotsPerKesPeriod == rhs.slotsPerKesPeriod &&
            lhs.slotLength == rhs.slotLength &&
            lhs.maxKesEvolutions == rhs.maxKesEvolutions &&
            lhs.securityParam == rhs.securityParam
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(activeSlotsCoefficient.hashValue)
        hasher.combine(updateQuorum.hashValue)
        hasher.combine(maxLovelaceSupply.hashValue)
        hasher.combine(networkMagic.hashValue)
        hasher.combine(epochLength.hashValue)
        hasher.combine(systemStart.hashValue)
        hasher.combine(slotsPerKesPeriod.hashValue)
        hasher.combine(slotLength.hashValue)
        hasher.combine(maxKesEvolutions.hashValue)
        hasher.combine(securityParam.hashValue)
    }
}