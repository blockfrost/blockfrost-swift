# CardanoAssetsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAsset**](CardanoAssetsAPI.md#getasset) | **GET** /assets/{asset} | Specific asset
[**getAssetAddresses**](CardanoAssetsAPI.md#getassetaddresses) | **GET** /assets/{asset}/addresses | Asset addresses
[**getAssetHistory**](CardanoAssetsAPI.md#getassethistory) | **GET** /assets/{asset}/history | Asset history
[**getAssetTransactions**](CardanoAssetsAPI.md#getassettransactions) | **GET** /assets/{asset}/transactions | Asset transactions
[**getAssetTxs**](CardanoAssetsAPI.md#getassettxs) | **GET** /assets/{asset}/txs | Asset transactions
[**getAssets**](CardanoAssetsAPI.md#getassets) | **GET** /assets | Assets
[**getPolicyAssets**](CardanoAssetsAPI.md#getpolicyassets) | **GET** /assets/policy/{policy_id} | Assets of a specific policy


# **getAsset**
```swift
    open class func getAsset(asset: String, completion: @escaping (_ data: Asset?, _ error: Error?) -> Void)
```

Specific asset

Information about a specific asset

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let asset = "asset_example" // String | Concatenation of the policy_id and hex-encoded asset_name

// Specific asset
CardanoAssetsAPI.getAsset(asset: asset) { (response, error) in
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
 **asset** | **String** | Concatenation of the policy_id and hex-encoded asset_name | 

### Return type

[**Asset**](Asset.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAssetAddresses**
```swift
    open class func getAssetAddresses(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AssetAddress]?, _ error: Error?) -> Void)
```

Asset addresses

List of a addresses containing a specific asset

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let asset = "asset_example" // String | Concatenation of the policy_id and hex-encoded asset_name
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Asset addresses
CardanoAssetsAPI.getAssetAddresses(asset: asset, count: count, page: page, order: order) { (response, error) in
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
 **asset** | **String** | Concatenation of the policy_id and hex-encoded asset_name | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AssetAddress]**](AssetAddress.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAssetHistory**
```swift
    open class func getAssetHistory(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AssetHistory]?, _ error: Error?) -> Void)
```

Asset history

History of a specific asset

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let asset = "asset_example" // String | Concatenation of the policy_id and hex-encoded asset_name
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Asset history
CardanoAssetsAPI.getAssetHistory(asset: asset, count: count, page: page, order: order) { (response, error) in
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
 **asset** | **String** | Concatenation of the policy_id and hex-encoded asset_name | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AssetHistory]**](AssetHistory.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAssetTransactions**
```swift
    open class func getAssetTransactions(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AssetTransaction]?, _ error: Error?) -> Void)
```

Asset transactions

List of a specific asset transactions

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let asset = "asset_example" // String | Concatenation of the policy_id and hex-encoded asset_name
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Asset transactions
CardanoAssetsAPI.getAssetTransactions(asset: asset, count: count, page: page, order: order) { (response, error) in
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
 **asset** | **String** | Concatenation of the policy_id and hex-encoded asset_name | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AssetTransaction]**](AssetTransaction.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAssetTxs**
```swift
    open class func getAssetTxs(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Asset transactions

List of a specific asset transactions

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let asset = "asset_example" // String | Concatenation of the policy_id and hex-encoded asset_name
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Asset transactions
CardanoAssetsAPI.getAssetTxs(asset: asset, count: count, page: page, order: order) { (response, error) in
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
 **asset** | **String** | Concatenation of the policy_id and hex-encoded asset_name | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
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

# **getAssets**
```swift
    open class func getAssets(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [Asset]?, _ error: Error?) -> Void)
```

Assets

List of assets.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Assets
CardanoAssetsAPI.getAssets(count: count, page: page, order: order) { (response, error) in
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
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[Asset]**](Asset.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPolicyAssets**
```swift
    open class func getPolicyAssets(policyId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AssetPolicy]?, _ error: Error?) -> Void)
```

Assets of a specific policy

List of asset minted under a specific policy

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let policyId = "policyId_example" // String | Specific policy_id
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Assets of a specific policy
CardanoAssetsAPI.getPolicyAssets(policyId: policyId, count: count, page: page, order: order) { (response, error) in
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
 **policyId** | **String** | Specific policy_id | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AssetPolicy]**](AssetPolicy.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

