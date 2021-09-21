# CardanoTransactionsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTransaction**](CardanoTransactionsAPI.md#gettransaction) | **GET** /txs/{hash} | Specific transaction
[**getTransactionDelegations**](CardanoTransactionsAPI.md#gettransactiondelegations) | **GET** /txs/{hash}/delegations | Transaction delegation certificates
[**getTransactionMetadata**](CardanoTransactionsAPI.md#gettransactionmetadata) | **GET** /txs/{hash}/metadata | Transaction metadata
[**getTransactionMetadataCbor**](CardanoTransactionsAPI.md#gettransactionmetadatacbor) | **GET** /txs/{hash}/metadata/cbor | Transaction metadata in CBOR
[**getTransactionMirs**](CardanoTransactionsAPI.md#gettransactionmirs) | **GET** /txs/{hash}/mirs | Transaction MIRs
[**getTransactionPoolRetires**](CardanoTransactionsAPI.md#gettransactionpoolretires) | **GET** /txs/{hash}/pool_retires | Transaction stake pool retirement certificates
[**getTransactionPoolUpdates**](CardanoTransactionsAPI.md#gettransactionpoolupdates) | **GET** /txs/{hash}/pool_updates | Transaction stake pool registration and update certificates
[**getTransactionRedeemers**](CardanoTransactionsAPI.md#gettransactionredeemers) | **GET** /txs/{hash}/redeemers | Transaction redeemers
[**getTransactionStakes**](CardanoTransactionsAPI.md#gettransactionstakes) | **GET** /txs/{hash}/stakes | Transaction stake addresses certificates
[**getTransactionUtxos**](CardanoTransactionsAPI.md#gettransactionutxos) | **GET** /txs/{hash}/utxos | Transaction UTXOs
[**getTransactionWithdrawals**](CardanoTransactionsAPI.md#gettransactionwithdrawals) | **GET** /txs/{hash}/withdrawals | Transaction withdrawal
[**submitTransaction**](CardanoTransactionsAPI.md#submittransaction) | **POST** /tx/submit | Submit a transaction


# **getTransaction**
```swift
    open class func getTransaction(hash: String, completion: @escaping (_ data: TxContent?, _ error: Error?) -> Void)
```

Specific transaction

Return content of the requested transaction.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Specific transaction
CardanoTransactionsAPI.getTransaction(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**TxContent**](TxContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionDelegations**
```swift
    open class func getTransactionDelegations(hash: String, completion: @escaping (_ data: [TxContentDelegation]?, _ error: Error?) -> Void)
```

Transaction delegation certificates

Obtain information about delegation certificates of a specific transaction. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction.

// Transaction delegation certificates
CardanoTransactionsAPI.getTransactionDelegations(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction. | 

### Return type

[**[TxContentDelegation]**](TxContentDelegation.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionMetadata**
```swift
    open class func getTransactionMetadata(hash: String, completion: @escaping (_ data: [TxContentMetadata]?, _ error: Error?) -> Void)
```

Transaction metadata

Obtain the transaction metadata.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction metadata
CardanoTransactionsAPI.getTransactionMetadata(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**[TxContentMetadata]**](TxContentMetadata.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionMetadataCbor**
```swift
    open class func getTransactionMetadataCbor(hash: String, completion: @escaping (_ data: [TxContentMetadataCbor]?, _ error: Error?) -> Void)
```

Transaction metadata in CBOR

Obtain the transaction metadata in CBOR.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction metadata in CBOR
CardanoTransactionsAPI.getTransactionMetadataCbor(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**[TxContentMetadataCbor]**](TxContentMetadataCbor.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionMirs**
```swift
    open class func getTransactionMirs(hash: String, completion: @escaping (_ data: [TxContentMir]?, _ error: Error?) -> Void)
```

Transaction MIRs

Obtain information about Move Instantaneous Rewards (MIRs) of a specific transaction.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction.

// Transaction MIRs
CardanoTransactionsAPI.getTransactionMirs(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction. | 

### Return type

[**[TxContentMir]**](TxContentMir.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionPoolRetires**
```swift
    open class func getTransactionPoolRetires(hash: String, completion: @escaping (_ data: [TxContentPoolRetir]?, _ error: Error?) -> Void)
```

Transaction stake pool retirement certificates

Obtain information about stake pool retirements within a specific transaction. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction stake pool retirement certificates
CardanoTransactionsAPI.getTransactionPoolRetires(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**[TxContentPoolRetir]**](TxContentPoolRetir.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionPoolUpdates**
```swift
    open class func getTransactionPoolUpdates(hash: String, completion: @escaping (_ data: [TxContentPoolCert]?, _ error: Error?) -> Void)
```

Transaction stake pool registration and update certificates

Obtain information about stake pool registration and update certificates of a specific transaction. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction stake pool registration and update certificates
CardanoTransactionsAPI.getTransactionPoolUpdates(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**[TxContentPoolCert]**](TxContentPoolCert.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionRedeemers**
```swift
    open class func getTransactionRedeemers(hash: String, completion: @escaping (_ data: [TxContentRedeemer]?, _ error: Error?) -> Void)
```

Transaction redeemers

Obtain the transaction redeemers.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction redeemers
CardanoTransactionsAPI.getTransactionRedeemers(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**[TxContentRedeemer]**](TxContentRedeemer.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionStakes**
```swift
    open class func getTransactionStakes(hash: String, completion: @escaping (_ data: [TxContentStakeAddr]?, _ error: Error?) -> Void)
```

Transaction stake addresses certificates

Obtain information about (de)registration of stake addresses within a transaction. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction.

// Transaction stake addresses certificates
CardanoTransactionsAPI.getTransactionStakes(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction. | 

### Return type

[**[TxContentStakeAddr]**](TxContentStakeAddr.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionUtxos**
```swift
    open class func getTransactionUtxos(hash: String, completion: @escaping (_ data: TxContentUtxo?, _ error: Error?) -> Void)
```

Transaction UTXOs

Return the inputs and UTXOs of the specific transaction.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction

// Transaction UTXOs
CardanoTransactionsAPI.getTransactionUtxos(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction | 

### Return type

[**TxContentUtxo**](TxContentUtxo.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionWithdrawals**
```swift
    open class func getTransactionWithdrawals(hash: String, completion: @escaping (_ data: [TxContentWithdrawal]?, _ error: Error?) -> Void)
```

Transaction withdrawal

Obtain information about withdrawals of a specific transaction.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hash = "hash_example" // String | Hash of the requested transaction.

// Transaction withdrawal
CardanoTransactionsAPI.getTransactionWithdrawals(hash: hash) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String** | Hash of the requested transaction. | 

### Return type

[**[TxContentWithdrawal]**](TxContentWithdrawal.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitTransaction**
```swift
    open class func submitTransaction(contentType: ContentType_submitTransaction, completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

Submit a transaction

Submit an already serialized transaction to the network.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let contentType = "contentType_example" // String | 

// Submit a transaction
CardanoTransactionsAPI.submitTransaction(contentType: contentType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contentType** | **String** |  | 

### Return type

**String**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

