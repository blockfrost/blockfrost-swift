# CardanoAddressesAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAddress**](CardanoAddressesAPI.md#getaddress) | **GET** /addresses/{address} | Specific address
[**getAddressDetails**](CardanoAddressesAPI.md#getaddressdetails) | **GET** /addresses/{address}/total | Address details
[**getAddressTransactions**](CardanoAddressesAPI.md#getaddresstransactions) | **GET** /addresses/{address}/transactions | Address transactions
[**getAddressTxs**](CardanoAddressesAPI.md#getaddresstxs) | **GET** /addresses/{address}/txs | Address transactions
[**getAddressUtxos**](CardanoAddressesAPI.md#getaddressutxos) | **GET** /addresses/{address}/utxos | Address UTXOs


# **getAddress**
```swift
    open class func getAddress(address: String, completion: @escaping (_ data: AddressContent?, _ error: Error?) -> Void)
```

Specific address

Obtain information about a specific address.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let address = "address_example" // String | Bech32 address.

// Specific address
CardanoAddressesAPI.getAddress(address: address) { (response, error) in
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
 **address** | **String** | Bech32 address. | 

### Return type

[**AddressContent**](AddressContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAddressDetails**
```swift
    open class func getAddressDetails(address: String, completion: @escaping (_ data: AddressContentTotal?, _ error: Error?) -> Void)
```

Address details

Obtain details about an address.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let address = "address_example" // String | Bech32 address.

// Address details
CardanoAddressesAPI.getAddressDetails(address: address) { (response, error) in
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
 **address** | **String** | Bech32 address. | 

### Return type

[**AddressContentTotal**](AddressContentTotal.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAddressTransactions**
```swift
    open class func getAddressTransactions(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, from: String? = nil, to: String? = nil, completion: @escaping (_ data: [AddressTransactionsContent]?, _ error: Error?) -> Void)
```

Address transactions

Transactions on the address.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let address = "address_example" // String | Bech32 address.
let count = 987 // Int | The numbers of pools per page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)
let from = "from_example" // String | The block number and optionally also index from which (inclusive) to start search for results, concatenated using colon. Has to be lower than or equal to `to` parameter.  (optional)
let to = "to_example" // String | The block number and optionally also index where (inclusive) to end the search for results, concatenated using colon. Has to be higher than or equal to `from` parameter.  (optional)

// Address transactions
CardanoAddressesAPI.getAddressTransactions(address: address, count: count, page: page, order: order, from: from, to: to) { (response, error) in
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
 **address** | **String** | Bech32 address. | 
 **count** | **Int** | The numbers of pools per page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]
 **from** | **String** | The block number and optionally also index from which (inclusive) to start search for results, concatenated using colon. Has to be lower than or equal to &#x60;to&#x60; parameter.  | [optional] 
 **to** | **String** | The block number and optionally also index where (inclusive) to end the search for results, concatenated using colon. Has to be higher than or equal to &#x60;from&#x60; parameter.  | [optional] 

### Return type

[**[AddressTransactionsContent]**](AddressTransactionsContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAddressTxs**
```swift
    open class func getAddressTxs(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Address transactions

Transactions on the address.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let address = "address_example" // String | Bech32 address.
let count = 987 // Int | The number of transactions per page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Address transactions
CardanoAddressesAPI.getAddressTxs(address: address, count: count, page: page, order: order) { (response, error) in
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
 **address** | **String** | Bech32 address. | 
 **count** | **Int** | The number of transactions per page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

**[String]**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAddressUtxos**
```swift
    open class func getAddressUtxos(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AddressUtxoContent]?, _ error: Error?) -> Void)
```

Address UTXOs

UTXOs of the address.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let address = "address_example" // String | Bech32 address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Address UTXOs
CardanoAddressesAPI.getAddressUtxos(address: address, count: count, page: page, order: order) { (response, error) in
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
 **address** | **String** | Bech32 address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AddressUtxoContent]**](AddressUtxoContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

