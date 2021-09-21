# Asset

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asset** | **String** | Hex-encoded asset full name | 
**policyId** | **String** | Policy ID of the asset | 
**assetName** | **String** | Hex-encoded asset name of the asset | 
**fingerprint** | **String** | CIP14 based user-facing fingerprint | 
**quantity** | **String** | Current asset quantity | 
**initialMintTxHash** | **String** | ID of the initial minting transaction | 
**mintOrBurnCount** | **Int** | Count of mint and burn transactions | 
**onchainMetadata** | [String: AnyCodable] | On-chain metadata stored in the minting transaction under label 721, community discussion around the standard ongoing at https://github.com/cardano-foundation/CIPs/pull/85  | 
**metadata** | [**AssetMetadata**](AssetMetadata.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


