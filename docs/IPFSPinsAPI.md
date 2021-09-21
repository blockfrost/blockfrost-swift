# IPFSPinsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPinList**](IPFSPinsAPI.md#getpinlist) | **GET** /ipfs/pin/list/ | List pinned objects
[**getPinListByIpfsPath**](IPFSPinsAPI.md#getpinlistbyipfspath) | **GET** /ipfs/pin/list/{IPFS_path} | Get details about pinned object
[**pinAdd**](IPFSPinsAPI.md#pinadd) | **POST** /ipfs/pin/add/{IPFS_path} | Pin an object
[**removePin**](IPFSPinsAPI.md#removepin) | **POST** /ipfs/pin/remove/{IPFS_path} | 


# **getPinList**
```swift
    open class func getPinList(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [InlineResponse2005]?, _ error: Error?) -> Void)
```

List pinned objects

List objects pinned to local storage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// List pinned objects
IPFSPinsAPI.getPinList(count: count, page: page, order: order) { (response, error) in
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

[**[InlineResponse2005]**](InlineResponse2005.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPinListByIpfsPath**
```swift
    open class func getPinListByIpfsPath(iPFSPath: String, completion: @escaping (_ data: InlineResponse2006?, _ error: Error?) -> Void)
```

Get details about pinned object

Get information about locally pinned IPFS object

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let iPFSPath = "iPFSPath_example" // String | 

// Get details about pinned object
IPFSPinsAPI.getPinListByIpfsPath(iPFSPath: iPFSPath) { (response, error) in
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
 **iPFSPath** | **String** |  | 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pinAdd**
```swift
    open class func pinAdd(iPFSPath: String, completion: @escaping (_ data: InlineResponse2004?, _ error: Error?) -> Void)
```

Pin an object

Pinned objects are counted in your user storage quota.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let iPFSPath = "iPFSPath_example" // String | 

// Pin an object
IPFSPinsAPI.pinAdd(iPFSPath: iPFSPath) { (response, error) in
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
 **iPFSPath** | **String** |  | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removePin**
```swift
    open class func removePin(iPFSPath: String, completion: @escaping (_ data: InlineResponse2007?, _ error: Error?) -> Void)
```



Remove pinned objects from local storage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let iPFSPath = "iPFSPath_example" // String | 

IPFSPinsAPI.removePin(iPFSPath: iPFSPath) { (response, error) in
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
 **iPFSPath** | **String** |  | 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

