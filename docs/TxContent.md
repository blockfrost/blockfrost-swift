# TxContent

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**hash** | **String** | Transaction hash | 
**block** | **String** | Block hash | 
**blockHeight** | **Int** | Block number | 
**slot** | **Int** | Slot number | 
**index** | **Int** | Transaction index within the block | 
**outputAmount** | [TxContentOutputAmount] |  | 
**fees** | **String** | Fees of the transaction in Lovelaces | 
**deposit** | **String** | Deposit within the transaction in Lovelaces | 
**size** | **Int** | Size of the transaction in Bytes | 
**invalidBefore** | **String** | Left (included) endpoint of the timelock validity intervals | 
**invalidHereafter** | **String** | Right (excluded) endpoint of the timelock validity intervals | 
**utxoCount** | **Int** | Count of UTXOs within the transaction | 
**withdrawalCount** | **Int** | Count of the withdrawals within the transaction | 
**mirCertCount** | **Int** | Count of the MIR certificates within the transaction | 
**delegationCount** | **Int** | Count of the delegations within the transaction | 
**stakeCertCount** | **Int** | Count of the stake keys (de)registration and delegation certificates within the transaction | 
**poolUpdateCount** | **Int** | Count of the stake pool registration and update certificates within the transaction | 
**poolRetireCount** | **Int** | Count of the stake pool retirement certificates within the transaction | 
**assetMintOrBurnCount** | **Int** | Count of asset mints and burns within the transaction | 
**redeemerCount** | **Int** | Count of redeemers within the transaction | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


