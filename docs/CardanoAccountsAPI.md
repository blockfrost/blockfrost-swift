# CardanoAccountsAPI

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAccountAddresses**](CardanoAccountsAPI.md#getaccountaddresses) | **GET** /accounts/{stake_address}/addresses | Account associated addresses
[**getAccountAssets**](CardanoAccountsAPI.md#getaccountassets) | **GET** /accounts/{stake_address}/addresses/assets | Assets associated with the account addresses
[**getAccountByStakeAddress**](CardanoAccountsAPI.md#getaccountbystakeaddress) | **GET** /accounts/{stake_address} | Specific account address
[**getAccountDelegationHistory**](CardanoAccountsAPI.md#getaccountdelegationhistory) | **GET** /accounts/{stake_address}/delegations | Account delegation history
[**getAccountHistory**](CardanoAccountsAPI.md#getaccounthistory) | **GET** /accounts/{stake_address}/history | Account history
[**getAccountMirHistory**](CardanoAccountsAPI.md#getaccountmirhistory) | **GET** /accounts/{stake_address}/mirs | Account MIR history
[**getAccountRegistrationHistory**](CardanoAccountsAPI.md#getaccountregistrationhistory) | **GET** /accounts/{stake_address}/registrations | Account registration history
[**getAccountRewardHistory**](CardanoAccountsAPI.md#getaccountrewardhistory) | **GET** /accounts/{stake_address}/rewards | Account reward history
[**getAccountWithdrawalHistory**](CardanoAccountsAPI.md#getaccountwithdrawalhistory) | **GET** /accounts/{stake_address}/withdrawals | Account withdrawal history


# **getAccountAddresses**
```swift
    open class func getAccountAddresses(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountAddressesContent]?, _ error: Error?) -> Void)
```

Account associated addresses

Obtain information about the addresses of a specific account.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account associated addresses
CardanoAccountsAPI.getAccountAddresses(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountAddressesContent]**](AccountAddressesContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountAssets**
```swift
    open class func getAccountAssets(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountAddressesAsset]?, _ error: Error?) -> Void)
```

Assets associated with the account addresses

Obtain information about assets associated with addresses of a specific account.  <b>Be careful</b>, as an account could be part of a mangled address and does not necessarily mean the addresses are owned by user as the account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Assets associated with the account addresses
CardanoAccountsAPI.getAccountAssets(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountAddressesAsset]**](AccountAddressesAsset.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountByStakeAddress**
```swift
    open class func getAccountByStakeAddress(stakeAddress: String, completion: @escaping (_ data: AccountContent?, _ error: Error?) -> Void)
```

Specific account address

Obtain information about a specific stake account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.

// Specific account address
CardanoAccountsAPI.getAccountByStakeAddress(stakeAddress: stakeAddress) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 

### Return type

[**AccountContent**](AccountContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountDelegationHistory**
```swift
    open class func getAccountDelegationHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountDelegationContent]?, _ error: Error?) -> Void)
```

Account delegation history

Obtain information about the delegation of a specific account.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account delegation history
CardanoAccountsAPI.getAccountDelegationHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountDelegationContent]**](AccountDelegationContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountHistory**
```swift
    open class func getAccountHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountHistoryContent]?, _ error: Error?) -> Void)
```

Account history

Obtain information about the history of a specific account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account history
CardanoAccountsAPI.getAccountHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountHistoryContent]**](AccountHistoryContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountMirHistory**
```swift
    open class func getAccountMirHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountMirContent]?, _ error: Error?) -> Void)
```

Account MIR history

Obtain information about the MIRs of a specific account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account MIR history
CardanoAccountsAPI.getAccountMirHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountMirContent]**](AccountMirContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountRegistrationHistory**
```swift
    open class func getAccountRegistrationHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountRegistrationContent]?, _ error: Error?) -> Void)
```

Account registration history

Obtain information about the registrations and deregistrations of a specific account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account registration history
CardanoAccountsAPI.getAccountRegistrationHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountRegistrationContent]**](AccountRegistrationContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountRewardHistory**
```swift
    open class func getAccountRewardHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountRewardContent]?, _ error: Error?) -> Void)
```

Account reward history

Obtain information about the reward history of a specific account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account reward history
CardanoAccountsAPI.getAccountRewardHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountRewardContent]**](AccountRewardContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountWithdrawalHistory**
```swift
    open class func getAccountWithdrawalHistory(stakeAddress: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, completion: @escaping (_ data: [AccountWithdrawalContent]?, _ error: Error?) -> Void)
```

Account withdrawal history

Obtain information about the withdrawals of a specific account. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import BlockfrostSwift

let stakeAddress = "stakeAddress_example" // String | Bech32 stake address.
let count = 987 // Int | The number of results displayed on one page. (optional) (default to 100)
let page = 987 // Int | The page number for listing the results. (optional) (default to 1)
let order = "order_example" // SortOrder | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional) (default to .asc)

// Account withdrawal history
CardanoAccountsAPI.getAccountWithdrawalHistory(stakeAddress: stakeAddress, count: count, page: page, order: order) { (response, error) in
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
 **stakeAddress** | **String** | Bech32 stake address. | 
 **count** | **Int** | The number of results displayed on one page. | [optional] [default to 100]
 **page** | **Int** | The page number for listing the results. | [optional] [default to 1]
 **order** | **SortOrder** | The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  | [optional] [default to .asc]

### Return type

[**[AccountWithdrawalContent]**](AccountWithdrawalContent.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

