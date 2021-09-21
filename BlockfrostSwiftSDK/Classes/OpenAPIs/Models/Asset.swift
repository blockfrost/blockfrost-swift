//
// Asset.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public final class Asset: Codable, Hashable {
    /** Hex-encoded asset full name */
    public var asset: String
    /** Policy ID of the asset */
    public var policyId: String
    /** Hex-encoded asset name of the asset */
    public var assetName: String?
    /** CIP14 based user-facing fingerprint */
    public var fingerprint: String
    /** Current asset quantity */
    public var quantity: String
    /** ID of the initial minting transaction */
    public var initialMintTxHash: String
    /** Count of mint and burn transactions */
    public var mintOrBurnCount: Int
    /** On-chain metadata stored in the minting transaction under label 721, community discussion around the standard ongoing at https://github.com/cardano-foundation/CIPs/pull/85  */
    public var onchainMetadata: [String: AnyCodable]?
    public var metadata: AssetMetadata?

    public init(asset: String, policyId: String, assetName: String?, fingerprint: String, quantity: String, initialMintTxHash: String, mintOrBurnCount: Int, onchainMetadata: [String: AnyCodable]?, metadata: AssetMetadata?) {
        self.asset = asset
        self.policyId = policyId
        self.assetName = assetName
        self.fingerprint = fingerprint
        self.quantity = quantity
        self.initialMintTxHash = initialMintTxHash
        self.mintOrBurnCount = mintOrBurnCount
        self.onchainMetadata = onchainMetadata
        self.metadata = metadata
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case asset
        case policyId = "policy_id"
        case assetName = "asset_name"
        case fingerprint
        case quantity
        case initialMintTxHash = "initial_mint_tx_hash"
        case mintOrBurnCount = "mint_or_burn_count"
        case onchainMetadata = "onchain_metadata"
        case metadata
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(asset, forKey: .asset)
        try container.encode(policyId, forKey: .policyId)
        try container.encode(assetName, forKey: .assetName)
        try container.encode(fingerprint, forKey: .fingerprint)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(initialMintTxHash, forKey: .initialMintTxHash)
        try container.encode(mintOrBurnCount, forKey: .mintOrBurnCount)
        try container.encode(onchainMetadata, forKey: .onchainMetadata)
        try container.encode(metadata, forKey: .metadata)
    }

    public static func == (lhs: Asset, rhs: Asset) -> Bool {
        lhs.asset == rhs.asset &&
            lhs.policyId == rhs.policyId &&
            lhs.assetName == rhs.assetName &&
            lhs.fingerprint == rhs.fingerprint &&
            lhs.quantity == rhs.quantity &&
            lhs.initialMintTxHash == rhs.initialMintTxHash &&
            lhs.mintOrBurnCount == rhs.mintOrBurnCount &&
            lhs.onchainMetadata == rhs.onchainMetadata &&
            lhs.metadata == rhs.metadata
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(asset.hashValue)
        hasher.combine(policyId.hashValue)
        hasher.combine(assetName.hashValue)
        hasher.combine(fingerprint.hashValue)
        hasher.combine(quantity.hashValue)
        hasher.combine(initialMintTxHash.hashValue)
        hasher.combine(mintOrBurnCount.hashValue)
        hasher.combine(onchainMetadata.hashValue)
        hasher.combine(metadata.hashValue)
    }
}
