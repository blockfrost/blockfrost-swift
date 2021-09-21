# CardanoScriptsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getScript**](CardanoScriptsAPI.md#getscript) | **GET** /scripts/{script_hash} | Specific script
[**getScriptRedeemers**](CardanoScriptsAPI.md#getscriptredeemers) | **GET** /scripts/{script_hash}/redeemers | Redeemers of a specific script
[**getScripts**](CardanoScriptsAPI.md#getscripts) | **GET** /scripts | Scripts


# **getScript**
```swift
    open class func getScript(scriptHash: String, completion: @escaping (_ data: Script?, _ error: Error?) -> Void)
```

Specific script

Information about a specific script

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let scriptHash = "scriptHash_example" // String | Hash of the script

// Specific script
CardanoScriptsAPI.getScript(scriptHash: scriptHash) { (response, error) in
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
 **scriptHash** | **String** | Hash of the script | 

### Return type

[**Script**](Script.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getScriptRedeemers**
```swift
    open class func getScriptRedeemers(scriptHash: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [ScriptRedeemer]?, _ error: Error?) -> Void)
```

Redeemers of a specific script

List of redeemers of a specific script

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let scriptHash = "scriptHash_example" // String | Hash of the script
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Redeemers of a specific script
CardanoScriptsAPI.getScriptRedeemers(scriptHash: scriptHash, count: count, page: page, order: order) { (response, error) in
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
 **scriptHash** | **String** | Hash of the script | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[ScriptRedeemer]**](ScriptRedeemer.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getScripts**
```swift
    open class func getScripts(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [Script]?, _ error: Error?) -> Void)
```

Scripts

List of scripts.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Scripts
CardanoScriptsAPI.getScripts(count: count, page: page, order: order) { (response, error) in
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

[**[Script]**](Script.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

