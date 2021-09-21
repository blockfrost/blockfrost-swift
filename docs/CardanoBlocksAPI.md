# CardanoBlocksAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBlock**](CardanoBlocksAPI.md#getblock) | **GET** /blocks/{hash_or_number} | Specific block
[**getBlockInEpochInSlot**](CardanoBlocksAPI.md#getblockinepochinslot) | **GET** /blocks/epoch/{epoch_number}/slot/{slot_number} | Specific block in a slot in an epoch
[**getBlockInSlot**](CardanoBlocksAPI.md#getblockinslot) | **GET** /blocks/slot/{slot_number} | Specific block in a slot
[**getBlockTransactions**](CardanoBlocksAPI.md#getblocktransactions) | **GET** /blocks/{hash_or_number}/txs | Block transactions
[**getLatestBlock**](CardanoBlocksAPI.md#getlatestblock) | **GET** /blocks/latest | Latest block
[**getNextBlocks**](CardanoBlocksAPI.md#getnextblocks) | **GET** /blocks/{hash_or_number}/next | Listing of next blocks
[**getPreviousBlocks**](CardanoBlocksAPI.md#getpreviousblocks) | **GET** /blocks/{hash_or_number}/previous | Listing of previous blocks
[**getTransactionsInLatestBlock**](CardanoBlocksAPI.md#gettransactionsinlatestblock) | **GET** /blocks/latest/txs | Latest block transactions


# **getBlock**
```swift
    open class func getBlock(hashOrNumber: String, completion: @escaping (_ data: BlockContent?, _ error: Error?) -> Void)
```

Specific block

Return the content of a requested block. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hashOrNumber = "hashOrNumber_example" // String | Hash or number of the requested block.

// Specific block
CardanoBlocksAPI.getBlock(hashOrNumber: hashOrNumber) { (response, error) in
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
 **hashOrNumber** | **String** | Hash or number of the requested block. | 

### Return type

[**BlockContent**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBlockInEpochInSlot**
```swift
    open class func getBlockInEpochInSlot(epochNumber: Int, slotNumber: Int, completion: @escaping (_ data: BlockContent?, _ error: Error?) -> Void)
```

Specific block in a slot in an epoch

Return the content of a requested block for a specific slot in an epoch. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let epochNumber = 987 // Int | Epoch for specific epoch slot.
let slotNumber = 987 // Int | Slot position for requested block.

// Specific block in a slot in an epoch
CardanoBlocksAPI.getBlockInEpochInSlot(epochNumber: epochNumber, slotNumber: slotNumber) { (response, error) in
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
 **epochNumber** | **Int** | Epoch for specific epoch slot. | 
 **slotNumber** | **Int** | Slot position for requested block. | 

### Return type

[**BlockContent**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBlockInSlot**
```swift
    open class func getBlockInSlot(slotNumber: Int, completion: @escaping (_ data: BlockContent?, _ error: Error?) -> Void)
```

Specific block in a slot

Return the content of a requested block for a specific slot. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let slotNumber = 987 // Int | Slot position for requested block.

// Specific block in a slot
CardanoBlocksAPI.getBlockInSlot(slotNumber: slotNumber) { (response, error) in
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
 **slotNumber** | **Int** | Slot position for requested block. | 

### Return type

[**BlockContent**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBlockTransactions**
```swift
    open class func getBlockTransactions(hashOrNumber: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Block transactions

Return the transactions within the block.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hashOrNumber = "hashOrNumber_example" // String | Hash of the requested block.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Block transactions
CardanoBlocksAPI.getBlockTransactions(hashOrNumber: hashOrNumber, count: count, page: page, order: order) { (response, error) in
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
 **hashOrNumber** | **String** | Hash of the requested block. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

**[String]**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestBlock**
```swift
    open class func getLatestBlock(completion: @escaping (_ data: BlockContent?, _ error: Error?) -> Void)
```

Latest block

Return the latest block available to the backends, also known as the tip of the blockchain. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Latest block
CardanoBlocksAPI.getLatestBlock() { (response, error) in
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

[**BlockContent**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNextBlocks**
```swift
    open class func getNextBlocks(hashOrNumber: String, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [BlockContent]?, _ error: Error?) -> Void)
```

Listing of next blocks

Return the list of blocks following a specific block. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hashOrNumber = "hashOrNumber_example" // String | Hash of the requested block.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)

// Listing of next blocks
CardanoBlocksAPI.getNextBlocks(hashOrNumber: hashOrNumber, count: count, page: page) { (response, error) in
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
 **hashOrNumber** | **String** | Hash of the requested block. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]

### Return type

[**[BlockContent]**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPreviousBlocks**
```swift
    open class func getPreviousBlocks(hashOrNumber: String, count: Int? = nil, page: Int? = nil, completion: @escaping (_ data: [BlockContent]?, _ error: Error?) -> Void)
```

Listing of previous blocks

Return the list of blocks preceding a specific block. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let hashOrNumber = "hashOrNumber_example" // String | Hash of the requested block
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)

// Listing of previous blocks
CardanoBlocksAPI.getPreviousBlocks(hashOrNumber: hashOrNumber, count: count, page: page) { (response, error) in
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
 **hashOrNumber** | **String** | Hash of the requested block | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]

### Return type

[**[BlockContent]**](BlockContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionsInLatestBlock**
```swift
    open class func getTransactionsInLatestBlock(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Latest block transactions

Return the transactions within the latest block.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Latest block transactions
CardanoBlocksAPI.getTransactionsInLatestBlock(count: count, page: page, order: order) { (response, error) in
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
 **order** | **SortOrder** | Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

**[String]**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

