# CardanoPoolsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPool**](CardanoPoolsAPI.md#getpool) | **GET** /pools/{pool_id} | Specific stake pool
[**getPoolBlocks**](CardanoPoolsAPI.md#getpoolblocks) | **GET** /pools/{pool_id}/blocks | Stake pool blocks
[**getPoolDelegators**](CardanoPoolsAPI.md#getpooldelegators) | **GET** /pools/{pool_id}/delegators | Stake pool delegators
[**getPoolHistory**](CardanoPoolsAPI.md#getpoolhistory) | **GET** /pools/{pool_id}/history | Stake pool history
[**getPoolMetadata**](CardanoPoolsAPI.md#getpoolmetadata) | **GET** /pools/{pool_id}/metadata | Stake pool metadata
[**getPoolRelays**](CardanoPoolsAPI.md#getpoolrelays) | **GET** /pools/{pool_id}/relays | Stake pool relays
[**getPoolUpdates**](CardanoPoolsAPI.md#getpoolupdates) | **GET** /pools/{pool_id}/updates | Stake pool updates
[**getPools**](CardanoPoolsAPI.md#getpools) | **GET** /pools | List of stake pools
[**getRetiredPools**](CardanoPoolsAPI.md#getretiredpools) | **GET** /pools/retired | List of retired stake pools
[**getRetiringPools**](CardanoPoolsAPI.md#getretiringpools) | **GET** /pools/retiring | List of retiring stake pools


# **getPool**
```swift
    open class func getPool(poolId: String, completion: @escaping (_ data: Pool?, _ error: Error?) -> Void)
```

Specific stake pool

Pool information.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.

// Specific stake pool
CardanoPoolsAPI.getPool(poolId: poolId) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 

### Return type

[**Pool**](Pool.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPoolBlocks**
```swift
    open class func getPoolBlocks(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Stake pool blocks

List of stake pools blocks.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Stake pool blocks
CardanoPoolsAPI.getPoolBlocks(poolId: poolId, count: count, page: page, order: order) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 
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

# **getPoolDelegators**
```swift
    open class func getPoolDelegators(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [PoolDelegator]?, _ error: Error?) -> Void)
```

Stake pool delegators

List of current stake pools delegators.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Stake pool delegators
CardanoPoolsAPI.getPoolDelegators(poolId: poolId, count: count, page: page, order: order) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[PoolDelegator]**](PoolDelegator.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPoolHistory**
```swift
    open class func getPoolHistory(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [PoolHistory]?, _ error: Error?) -> Void)
```

Stake pool history

History of stake pool parameters over epochs. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Stake pool history
CardanoPoolsAPI.getPoolHistory(poolId: poolId, count: count, page: page, order: order) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[PoolHistory]**](PoolHistory.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPoolMetadata**
```swift
    open class func getPoolMetadata(poolId: String, completion: @escaping (_ data: AnyOfpoolMetadataobject?, _ error: Error?) -> Void)
```

Stake pool metadata

Stake pool registration metadata. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.

// Stake pool metadata
CardanoPoolsAPI.getPoolMetadata(poolId: poolId) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 

### Return type

[**AnyOfpoolMetadataobject**](AnyOfpoolMetadataobject.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPoolRelays**
```swift
    open class func getPoolRelays(poolId: String, completion: @escaping (_ data: [PoolRelay]?, _ error: Error?) -> Void)
```

Stake pool relays

Relays of a stake pool.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.

// Stake pool relays
CardanoPoolsAPI.getPoolRelays(poolId: poolId) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 

### Return type

[**[PoolRelay]**](PoolRelay.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPoolUpdates**
```swift
    open class func getPoolUpdates(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [PoolUpdat]?, _ error: Error?) -> Void)
```

Stake pool updates

List of certificate updates to the stake pool.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let poolId = "poolId_example" // String | Bech32 or hexadecimal pool ID.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Stake pool updates
CardanoPoolsAPI.getPoolUpdates(poolId: poolId, count: count, page: page, order: order) { (response, error) in
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
 **poolId** | **String** | Bech32 or hexadecimal pool ID. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[PoolUpdat]**](PoolUpdat.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPools**
```swift
    open class func getPools(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

List of stake pools

List of registered stake pools.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The numbers of pools per page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// List of stake pools
CardanoPoolsAPI.getPools(count: count, page: page, order: order) { (response, error) in
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
 **count** | **Int** | The numbers of pools per page. | [optional] [default to 100]
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

# **getRetiredPools**
```swift
    open class func getRetiredPools(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [PoolListRetire]?, _ error: Error?) -> Void)
```

List of retired stake pools

List of already retired pools.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The numbers of pools per page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// List of retired stake pools
CardanoPoolsAPI.getRetiredPools(count: count, page: page, order: order) { (response, error) in
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
 **count** | **Int** | The numbers of pools per page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[PoolListRetire]**](PoolListRetire.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRetiringPools**
```swift
    open class func getRetiringPools(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [PoolListRetire]?, _ error: Error?) -> Void)
```

List of retiring stake pools

List of stake pools retiring in the upcoming epochs

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// List of retiring stake pools
CardanoPoolsAPI.getRetiringPools(count: count, page: page, order: order) { (response, error) in
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

[**[PoolListRetire]**](PoolListRetire.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

