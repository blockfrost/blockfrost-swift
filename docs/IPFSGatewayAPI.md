# IPFSGatewayAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**callGet**](IPFSGatewayAPI.md#callget) | **GET** /ipfs/gateway/{IPFS_path} | Relay to an IPFS gateway


# **callGet**
```swift
    open class func callGet(iPFSPath: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Relay to an IPFS gateway

Retrieve an object from the IFPS gateway (useful if you do not want to rely on a public gateway, such as `ipfs.blockfrost.dev`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let iPFSPath = "iPFSPath_example" // String | 

// Relay to an IPFS gateway
IPFSGatewayAPI.callGet(iPFSPath: iPFSPath) { (response, error) in
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

Void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

