# CardanoEpochsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getActiveStakesForEpoch**](CardanoEpochsAPI.md#getactivestakesforepoch) | **GET** /epochs/{number}/stakes | Stake distribution
[**getActiveStakesForEpochAndPool**](CardanoEpochsAPI.md#getactivestakesforepochandpool) | **GET** /epochs/{number}/stakes/{pool_id} | Stake distribution by pool
[**getBlocksForEpoch**](CardanoEpochsAPI.md#getblocksforepoch) | **GET** /epochs/{number}/blocks | Block distribution
[**getBlocksForEpochAndPool**](CardanoEpochsAPI.md#getblocksforepochandpool) | **GET** /epochs/{number}/blocks/{pool_id} | Block distribution by pool
[**getEpoch**](CardanoEpochsAPI.md#getepoch) | **GET** /epochs/{number} | Specific epoch
[**getEpochParam**](CardanoEpochsAPI.md#getepochparam) | **GET** /epochs/{number}/parameters | Protocol parameters
[**getLatestEpoch**](CardanoEpochsAPI.md#getlatestepoch) | **GET** /epochs/latest | Latest epoch
[**getLatestEpochParam**](CardanoEpochsAPI.md#getlatestepochparam) | **GET** /epochs/latest/parameters | Latest epoch protocol parameters
[**getNextEpochs**](CardanoEpochsAPI.md#getnextepochs) | **GET** /epochs/{number}/next | Listing of next epochs
[**getPreviousEpochs**](CardanoEpochsAPI.md#getpreviousepochs) | **GET** /epochs/{number}/previous | Listing of previous epochs


# **getActiveStakesForEpoch**
```swift
    open class func getActiveStakesForEpoch(number: Int, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [EpochStakeContent]?, _ error: Error?) -> Void)
```

Stake distribution

Return the active stake distribution for the specified epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)

// Stake distribution
CardanoEpochsAPI.getActiveStakesForEpoch(number: number, count: count, page: page) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]

### Return type

[**[EpochStakeContent]**](EpochStakeContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getActiveStakesForEpochAndPool**
```swift
    open class func getActiveStakesForEpochAndPool(number: Int, poolId: String, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [EpochStakePoolContent]?, _ error: Error?) -> Void)
```

Stake distribution by pool

Return the active stake distribution for the epoch specified by stake pool.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch
let poolId = "poolId_example" // String | Stake pool ID to filter
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)

// Stake distribution by pool
CardanoEpochsAPI.getActiveStakesForEpochAndPool(number: number, poolId: poolId, count: count, page: page) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 
 **poolId** | **String** | Stake pool ID to filter | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]

### Return type

[**[EpochStakePoolContent]**](EpochStakePoolContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBlocksForEpoch**
```swift
    open class func getBlocksForEpoch(number: Int, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Block distribution

Return the blocks minted for the epoch specified.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Block distribution
CardanoEpochsAPI.getBlocksForEpoch(number: number, count: count, page: page, order: order) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 
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

# **getBlocksForEpochAndPool**
```swift
    open class func getBlocksForEpochAndPool(number: Int, poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Block distribution by pool

Return the block minted for the epoch specified by stake pool.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch
let poolId = "poolId_example" // String | Stake pool ID to filter
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Block distribution by pool
CardanoEpochsAPI.getBlocksForEpochAndPool(number: number, poolId: poolId, count: count, page: page, order: order) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 
 **poolId** | **String** | Stake pool ID to filter | 
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

# **getEpoch**
```swift
    open class func getEpoch(number: Int, completion: @escaping (_ data: EpochContent?, _ error: Error?) -> Void)
```

Specific epoch

Return the content of the requested epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch

// Specific epoch
CardanoEpochsAPI.getEpoch(number: number) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 

### Return type

[**EpochContent**](EpochContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpochParam**
```swift
    open class func getEpochParam(number: Int, completion: @escaping (_ data: EpochParamContent?, _ error: Error?) -> Void)
```

Protocol parameters

Return the protocol parameters for the epoch specified.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch

// Protocol parameters
CardanoEpochsAPI.getEpochParam(number: number) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 

### Return type

[**EpochParamContent**](EpochParamContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestEpoch**
```swift
    open class func getLatestEpoch(completion: @escaping (_ data: EpochContent?, _ error: Error?) -> Void)
```

Latest epoch

Return the information about the latest, therefore current, epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Latest epoch
CardanoEpochsAPI.getLatestEpoch() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**EpochContent**](EpochContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestEpochParam**
```swift
    open class func getLatestEpochParam(completion: @escaping (_ data: EpochParamContent?, _ error: Error?) -> Void)
```

Latest epoch protocol parameters

Return the protocol parameters for the latest epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Latest epoch protocol parameters
CardanoEpochsAPI.getLatestEpochParam() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**EpochParamContent**](EpochParamContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNextEpochs**
```swift
    open class func getNextEpochs(number: Int, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [EpochContent]?, _ error: Error?) -> Void)
```

Listing of next epochs

Return the list of epochs following a specific epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the requested epoch.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)

// Listing of next epochs
CardanoEpochsAPI.getNextEpochs(number: number, count: count, page: page) { (response, error) in
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
 **number** | **Int** | Number of the requested epoch. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]

### Return type

[**[EpochContent]**](EpochContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPreviousEpochs**
```swift
    open class func getPreviousEpochs(number: Int, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [EpochContent]?, _ error: Error?) -> Void)
```

Listing of previous epochs

Return the list of epochs preceding a specific epoch.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let number = 987 // Int | Number of the epoch
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results (optional) (default to 1)

// Listing of previous epochs
CardanoEpochsAPI.getPreviousEpochs(number: number, count: count, page: page) { (response, error) in
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
 **number** | **Int** | Number of the epoch | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results | [optional] [default to 1]

### Return type

[**[EpochContent]**](EpochContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

