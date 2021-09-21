# MetricsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMetrics**](MetricsAPI.md#getmetrics) | **GET** /metrics/ | Blockfrost usage metrics
[**getMetricsEndpoints**](MetricsAPI.md#getmetricsendpoints) | **GET** /metrics/endpoints | Blockfrost endpoint usage metrics


# **getMetrics**
```swift
    open class func getMetrics(completion: @escaping (_ data: [Metric]?, _ error: Error?) -> Void)
```

Blockfrost usage metrics

History of your Blockfrost usage metrics in the past 30 days.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Blockfrost usage metrics
MetricsAPI.getMetrics() { (response, error) in
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

[**[Metric]**](Metric.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMetricsEndpoints**
```swift
    open class func getMetricsEndpoints(completion: @escaping (_ data: [MetricsEndpoint]?, _ error: Error?) -> Void)
```

Blockfrost endpoint usage metrics

History of your Blockfrost usage metrics per endpoint in the past 30 days. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Blockfrost endpoint usage metrics
MetricsAPI.getMetricsEndpoints() { (response, error) in
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

[**[MetricsEndpoint]**](MetricsEndpoint.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

