//
// Pool.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class Pool: Codable, Hashable {
    /** Bech32 pool ID */
    public var poolId: String
    /** Hexadecimal pool ID. */
    public var hex: String
    /** VRF key hash */
    public var vrfKey: String
    /** Total minted blocks */
    public var blocksMinted: Int
    public var liveStake: String
    public var liveSize: Double
    public var liveSaturation: Double
    public var liveDelegators: Double
    public var activeStake: String
    public var activeSize: Double
    /** Stake pool certificate pledge */
    public var declaredPledge: String
    /** Stake pool current pledge */
    public var livePledge: String
    /** Margin tax cost of the stake pool */
    public var marginCost: Double
    /** Fixed tax cost of the stake pool */
    public var fixedCost: String
    /** Bech32 reward account of the stake pool */
    public var rewardAccount: String
    public var owners: [String]
    public var registration: [String]
    public var retirement: [String]

    public init(poolId: String, hex: String, vrfKey: String, blocksMinted: Int, liveStake: String, liveSize: Double, liveSaturation: Double, liveDelegators: Double, activeStake: String, activeSize: Double, declaredPledge: String, livePledge: String, marginCost: Double, fixedCost: String, rewardAccount: String, owners: [String], registration: [String], retirement: [String]) {
        self.poolId = poolId
        self.hex = hex
        self.vrfKey = vrfKey
        self.blocksMinted = blocksMinted
        self.liveStake = liveStake
        self.liveSize = liveSize
        self.liveSaturation = liveSaturation
        self.liveDelegators = liveDelegators
        self.activeStake = activeStake
        self.activeSize = activeSize
        self.declaredPledge = declaredPledge
        self.livePledge = livePledge
        self.marginCost = marginCost
        self.fixedCost = fixedCost
        self.rewardAccount = rewardAccount
        self.owners = owners
        self.registration = registration
        self.retirement = retirement
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case poolId = "pool_id"
        case hex
        case vrfKey = "vrf_key"
        case blocksMinted = "blocks_minted"
        case liveStake = "live_stake"
        case liveSize = "live_size"
        case liveSaturation = "live_saturation"
        case liveDelegators = "live_delegators"
        case activeStake = "active_stake"
        case activeSize = "active_size"
        case declaredPledge = "declared_pledge"
        case livePledge = "live_pledge"
        case marginCost = "margin_cost"
        case fixedCost = "fixed_cost"
        case rewardAccount = "reward_account"
        case owners
        case registration
        case retirement
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(poolId, forKey: .poolId)
        try container.encode(hex, forKey: .hex)
        try container.encode(vrfKey, forKey: .vrfKey)
        try container.encode(blocksMinted, forKey: .blocksMinted)
        try container.encode(liveStake, forKey: .liveStake)
        try container.encode(liveSize, forKey: .liveSize)
        try container.encode(liveSaturation, forKey: .liveSaturation)
        try container.encode(liveDelegators, forKey: .liveDelegators)
        try container.encode(activeStake, forKey: .activeStake)
        try container.encode(activeSize, forKey: .activeSize)
        try container.encode(declaredPledge, forKey: .declaredPledge)
        try container.encode(livePledge, forKey: .livePledge)
        try container.encode(marginCost, forKey: .marginCost)
        try container.encode(fixedCost, forKey: .fixedCost)
        try container.encode(rewardAccount, forKey: .rewardAccount)
        try container.encode(owners, forKey: .owners)
        try container.encode(registration, forKey: .registration)
        try container.encode(retirement, forKey: .retirement)
    }

    public static func == (lhs: Pool, rhs: Pool) -> Bool {
        lhs.poolId == rhs.poolId &&
            lhs.hex == rhs.hex &&
            lhs.vrfKey == rhs.vrfKey &&
            lhs.blocksMinted == rhs.blocksMinted &&
            lhs.liveStake == rhs.liveStake &&
            lhs.liveSize == rhs.liveSize &&
            lhs.liveSaturation == rhs.liveSaturation &&
            lhs.liveDelegators == rhs.liveDelegators &&
            lhs.activeStake == rhs.activeStake &&
            lhs.activeSize == rhs.activeSize &&
            lhs.declaredPledge == rhs.declaredPledge &&
            lhs.livePledge == rhs.livePledge &&
            lhs.marginCost == rhs.marginCost &&
            lhs.fixedCost == rhs.fixedCost &&
            lhs.rewardAccount == rhs.rewardAccount &&
            lhs.owners == rhs.owners &&
            lhs.registration == rhs.registration &&
            lhs.retirement == rhs.retirement
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(poolId.hashValue)
        hasher.combine(hex.hashValue)
        hasher.combine(vrfKey.hashValue)
        hasher.combine(blocksMinted.hashValue)
        hasher.combine(liveStake.hashValue)
        hasher.combine(liveSize.hashValue)
        hasher.combine(liveSaturation.hashValue)
        hasher.combine(liveDelegators.hashValue)
        hasher.combine(activeStake.hashValue)
        hasher.combine(activeSize.hashValue)
        hasher.combine(declaredPledge.hashValue)
        hasher.combine(livePledge.hashValue)
        hasher.combine(marginCost.hashValue)
        hasher.combine(fixedCost.hashValue)
        hasher.combine(rewardAccount.hashValue)
        hasher.combine(owners.hashValue)
        hasher.combine(registration.hashValue)
        hasher.combine(retirement.hashValue)
    }
}
