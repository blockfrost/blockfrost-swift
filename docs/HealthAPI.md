# HealthAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiRoot**](HealthAPI.md#getapiroot) | **GET** / | Root endpoint
[**getCurrentBackendTime**](HealthAPI.md#getcurrentbackendtime) | **GET** /health/clock | Current backend time
[**getHealth**](HealthAPI.md#gethealth) | **GET** /health | Backend health status


# **getApiRoot**
```swift
    open class func getApiRoot(completion: @escaping (_ data: InlineResponse200?, _ error: Error?) -> Void)
```

Root endpoint

Root endpoint has no other function than to point end users to documentation. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Root endpoint
HealthAPI.getApiRoot() { (response, error) in
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

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentBackendTime**
```swift
    open class func getCurrentBackendTime(completion: @escaping (_ data: InlineResponse2002?, _ error: Error?) -> Void)
```

Current backend time

This endpoint provides the current UNIX time. Your application might use this to verify if the client clock is not out of sync. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Current backend time
HealthAPI.getCurrentBackendTime() { (response, error) in
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

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHealth**
```swift
    open class func getHealth(completion: @escaping (_ data: InlineResponse2001?, _ error: Error?) -> Void)
```

Backend health status

Return backend status as a boolean. Your application     should handle situations when backend for the given chain is unavailable. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Backend health status
HealthAPI.getHealth() { (response, error) in
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

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

