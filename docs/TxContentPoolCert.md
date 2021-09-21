# TxContentPoolCert

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**certIndex** | **Int** | Index of the certificate within the transaction | 
**poolId** | **String** | Bech32 encoded pool ID | 
**vrfKey** | **String** | VRF key hash | 
**pledge** | **String** | Stake pool certificate pledge in Lovelaces | 
**marginCost** | **Double** | Margin tax cost of the stake pool | 
**fixedCost** | **String** | Fixed tax cost of the stake pool in Lovelaces | 
**rewardAccount** | **String** | Bech32 reward account of the stake pool | 
**owners** | **[String]** |  | 
**metadata** | [**AnyCodable**](AnyCodable.md) |  | 
**relays** | [AnyCodable] |  | 
**activeEpoch** | **Int** | Epoch that the delegation becomes active | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


