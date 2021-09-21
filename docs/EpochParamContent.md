# EpochParamContent

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**epoch** | **Int** | Epoch number | 
**minFeeA** | **Int** | The linear factor for the minimum fee calculation for given epoch | 
**minFeeB** | **Int** | The constant factor for the minimum fee calculation | 
**maxBlockSize** | **Int** | Maximum block body size in Bytes | 
**maxTxSize** | **Int** | Maximum transaction size | 
**maxBlockHeaderSize** | **Int** | Maximum block header size | 
**keyDeposit** | **String** | The amount of a key registration deposit in Lovelaces | 
**poolDeposit** | **String** | The amount of a pool registration deposit in Lovelaces | 
**eMax** | **Int** | Epoch bound on pool retirement | 
**nOpt** | **Int** | Desired number of pools | 
**a0** | **Double** | Pool pledge influence | 
**rho** | **Double** | Monetary expansion | 
**tau** | **Double** | Treasury expansion | 
**decentralisationParam** | **Double** | Percentage of blocks produced by federated nodes | 
**extraEntropy** | [**AnyCodable**](.md) | Seed for extra entropy | 
**protocolMajorVer** | **Int** | Accepted protocol major version | 
**protocolMinorVer** | **Int** | Accepted protocol minor version | 
**minUtxo** | **String** | Minimum UTXO value | 
**minPoolCost** | **String** | Minimum stake cost forced on the pool | 
**nonce** | **String** | Epoch number only used once | 
**priceMem** | **Double** | The per word cost of script memory usage | 
**priceStep** | **Double** | The cost of script execution step usage | 
**maxTxExMem** | **String** | The maximum number of execution memory allowed to be used in a single transaction | 
**maxTxExSteps** | **String** | The maximum number of execution steps allowed to be used in a single transaction | 
**maxBlockExMem** | **String** | The maximum number of execution memory allowed to be used in a single block | 
**maxBlockExSteps** | **String** | The maximum number of execution steps allowed to be used in a single block | 
**maxValSize** | **String** | The maximum Val size | 
**collateralPercent** | **Double** | The percentage of the transactions fee which must be provided as collateral when including non-native scripts | 
**maxCollateralInputs** | **Int** | The maximum number of collateral inputs allowed in a transaction | 
**coinsPerUtxoWord** | **String** | The cost per UTxO word | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


