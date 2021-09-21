# IPFSAddAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add**](IPFSAddAPI.md#add) | **POST** /ipfs/add | Add a file to IPFS


# **add**
```swift
    open class func add(completion: @escaping (_ data: InlineResponse2003?, _ error: Error?) -> Void)
```

Add a file to IPFS

You need to `/ipfs/pin/add` an object to avoid it being garbage collected. This usage is being counted in your user account quota. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Add a file to IPFS
IPFSAddAPI.add() { (response, error) in
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

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

