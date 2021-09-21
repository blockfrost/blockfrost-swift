# CardanoLedgerAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGenesis**](CardanoLedgerAPI.md#getgenesis) | **GET** /genesis | Blockchain genesis


# **getGenesis**
```swift
    open class func getGenesis(completion: @escaping (_ data: GenesisContent?, _ error: Error?) -> Void)
```

Blockchain genesis

Return the information about blockchain genesis.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift


// Blockchain genesis
CardanoLedgerAPI.getGenesis() { (response, error) in
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

[**GenesisContent**](GenesisContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

