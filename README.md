# Swift5 API client for Blockfrost
![CI badge](https://github.com/blockfrost/blockfrost-swift/actions/workflows/test.yml/badge.svg)

Blockfrost is an API as a service that allows users to interact with the Cardano blockchain and parts of its ecosystem.
      
Note: work is in progress, we need to cover endpoints with tests.

## Tokens

After signing up on https://blockfrost.io, a `project_id` token is automatically generated for each project.
HTTP header of your request MUST include this `project_id` in order to authenticate against Blockfrost servers.

## Available networks

At the moment, you can use the following networks. Please, note that each network has its own `project_id`.

<table>
  <tr><td><b>Network</b></td><td><b>Endpoint</b></td></tr>
  <tr><td>Cardano mainnet</td><td><tt>https://cardano-mainnet.blockfrost.io/api/v0</td></tt></tr>
  <tr><td>Cardano testnet</td><td><tt>https://cardano-testnet.blockfrost.io/api/v0</tt></td></tr>
  <tr><td>InterPlanetary File System</td><td><tt>https://ipfs.blockfrost.io/api/v0</tt></td></tr>
</table>

## Concepts

* All endpoints return either a JSON object or an array.
* Data is returned in *ascending* (oldest first, newest last) order.
  * You might use the `?order=desc` query parameter to reverse this order.
* By default, we return 100 results at a time. You have to use `?page=2` to list through the results.
* All time and timestamp related fields (except `server_time`) are in seconds of UNIX time.
* All amounts are returned in Lovelaces, where 1 ADA = 1 000 000 Lovelaces.
* Addresses, accounts and pool IDs are in Bech32 format.
* All values are case sensitive.
* All hex encoded values are lower case.
* Examples are not based on real data. Any resemblance to actual events is purely coincidental.
* We allow to upload files up to 100MB of size to IPFS. This might increase in the future.

## Errors

### HTTP Status codes

The following are HTTP status code your application might receive when reaching Blockfrost endpoints and
it should handle all of these cases.

* HTTP `400` return code is used when the request is not valid.
* HTTP `402` return code is used when the projects exceed their daily request limit.
* HTTP `403` return code is used when the request is not authenticated.
* HTTP `404` return code is used when the resource doesn't exist.
* HTTP `418` return code is used when the user has been auto-banned for flooding too much after previously receiving error code `402` or `429`.
* HTTP `429` return code is used when the user has sent too many requests in a given amount of time and therefore has been rate-limited.
* HTTP `500` return code is used when our endpoints are having a problem.

### Error codes

An internal error code number is used for better indication of the error in question. It is passed using the following payload.

```json
{
  \"status_code\": 403,
  \"error\": \"Forbidden\",
  \"message\": \"Invalid project token.\"
}
```
## Limits

 There are two types of limits we are enforcing:

 The first depends on your plan and is the number of request we allow per day. We defined the day from midnight to midnight of UTC time.

 The second is rate limiting. We limit an end user, distinguished by IP address, to 10 requests per second. On top of that, we allow
 each user to send burst of 500 requests, which cools off at rate of 10 requests per second. In essence, a user is allowed to make another
 whole burst after (currently) 500/10 = 50 seconds. E.g. if a user attemtps to make a call 3 seconds after whole burst, 30 requests will be processed.
 We believe this should be sufficient for most of the use cases. If it is not and you have a specific use case, please get in touch with us, and
 we will make sure to take it into account as much as we can.
 
## SDKs

We support a number of SDKs that will help you in developing your application on top of Blockfrost.

<table>
  <tr><td><b>Programming language</b></td><td><b>SDK</b></td></tr>
  <tr><td>JavaScript</td><td><a href=\"https://github.com/blockfrost/blockfrost-js\">blockfrost-js</a></tr>
  <tr><td>Haskell</td><td><a href=\"https://github.com/blockfrost/blockfrost-haskell\">blockfrost-haskell</a></tr>
</table>


## Overview
This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project.  By using the [openapi-spec](https://github.com/OAI/OpenAPI-Specification) from a remote server, you can easily generate an API client.

- API version: 0.1.27
- Package version: 
- Build package: org.openapitools.codegen.languages.Swift5ClientCodegen
For more information, please visit [https://blockfrost.io](https://blockfrost.io)
            
## Usage
      
API uses a simple completion callbacks, returning `Swift.Result<R, Error>`, where `R` is defined by the particular API call. 

```swift
// import the SDK on the beginning of the file
import BlockfrostSwiftSDK

// define project-wide settings
BlockfrostStaticConfig.basePath = "https://cardano-mainnet.blockfrost.io/api/v0"  // or leave default
BlockfrostStaticConfig.projectId = "your-project-id"
let api = CardanoAddressesAPI()

_ = api.getAddressDetails(address: "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y") { resp in
    switch (resp) {
    case let .failure(err):
        // TODO: handle error here, `err` contains the error 
        break
    case let .success(r):
        // `r` contains result of the call, here, it is of type `AddressContentTotal`
        break
    }
}
```
        
Project ID can be loaded from env
```swift
BlockfrostStaticConfig.projectId = BlockfrostConfig.getEnvProjectId()  // BF_PROJECT_ID
BlockfrostStaticConfig.projectId = BlockfrostConfig.getEnvProjectIdMainnet()  // BF_MAINNET_PROJECT_ID
BlockfrostStaticConfig.projectId = BlockfrostConfig.getEnvProjectIdTestnet()  // BF_TESTNET_PROJECT_ID
BlockfrostStaticConfig.projectId = BlockfrostConfig.getEnvIpfsProjectId()  // BF_IPFS_PROJECT_ID
```
        
Default configuration for testnet, project ID is loaded from env var `BF_TESTNET_PROJECT_ID`
```swift
let apiAdd = CardanoAddressesAPI(config: BlockfrostConfig.testnetDefault())
```
        
Default configuration for IPFS, project ID is loaded from env var `BF_IPFS_PROJECT_ID`
```swift
let ipfsAdd = IPFSAddAPI(config: BlockfrostConfig.ipfsDefault())
```
        
You can also define API-specific configuration
```swift
let config = BlockfrostConfig()
config.basePath = BlockfrostConfig.URL_IPFS
config.projectId = BlockfrostConfig.getEnvIpfsProjectId()
config.retryPolicy = BlockfrostRetryPolicy(retryLimit: 10)    // specify custom retry policy

let ipfsAdd = apiAdd = IPFSAddAPI(config: cfg)
```

## Installation

### Carthage

Run `carthage update`

### CocoaPods

Run `pod install`

## Documentation for API Endpoints

All URIs are relative to *https://cardano-mainnet.blockfrost.io/api/v0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CardanoAccountsAPI* | [**getAccountAddresses**](docs/CardanoAccountsAPI.md#getaccountaddresses) | **GET** /accounts/{stake_address}/addresses | Account associated addresses
*CardanoAccountsAPI* | [**getAccountAssets**](docs/CardanoAccountsAPI.md#getaccountassets) | **GET** /accounts/{stake_address}/addresses/assets | Assets associated with the account addresses
*CardanoAccountsAPI* | [**getAccountByStakeAddress**](docs/CardanoAccountsAPI.md#getaccountbystakeaddress) | **GET** /accounts/{stake_address} | Specific account address
*CardanoAccountsAPI* | [**getAccountDelegationHistory**](docs/CardanoAccountsAPI.md#getaccountdelegationhistory) | **GET** /accounts/{stake_address}/delegations | Account delegation history
*CardanoAccountsAPI* | [**getAccountHistory**](docs/CardanoAccountsAPI.md#getaccounthistory) | **GET** /accounts/{stake_address}/history | Account history
*CardanoAccountsAPI* | [**getAccountMirHistory**](docs/CardanoAccountsAPI.md#getaccountmirhistory) | **GET** /accounts/{stake_address}/mirs | Account MIR history
*CardanoAccountsAPI* | [**getAccountRegistrationHistory**](docs/CardanoAccountsAPI.md#getaccountregistrationhistory) | **GET** /accounts/{stake_address}/registrations | Account registration history
*CardanoAccountsAPI* | [**getAccountRewardHistory**](docs/CardanoAccountsAPI.md#getaccountrewardhistory) | **GET** /accounts/{stake_address}/rewards | Account reward history
*CardanoAccountsAPI* | [**getAccountWithdrawalHistory**](docs/CardanoAccountsAPI.md#getaccountwithdrawalhistory) | **GET** /accounts/{stake_address}/withdrawals | Account withdrawal history
*CardanoAddressesAPI* | [**getAddress**](docs/CardanoAddressesAPI.md#getaddress) | **GET** /addresses/{address} | Specific address
*CardanoAddressesAPI* | [**getAddressDetails**](docs/CardanoAddressesAPI.md#getaddressdetails) | **GET** /addresses/{address}/total | Address details
*CardanoAddressesAPI* | [**getAddressTransactions**](docs/CardanoAddressesAPI.md#getaddresstransactions) | **GET** /addresses/{address}/transactions | Address transactions
*CardanoAddressesAPI* | [**getAddressTxs**](docs/CardanoAddressesAPI.md#getaddresstxs) | **GET** /addresses/{address}/txs | Address transactions
*CardanoAddressesAPI* | [**getAddressUtxos**](docs/CardanoAddressesAPI.md#getaddressutxos) | **GET** /addresses/{address}/utxos | Address UTXOs
*CardanoAssetsAPI* | [**getAsset**](docs/CardanoAssetsAPI.md#getasset) | **GET** /assets/{asset} | Specific asset
*CardanoAssetsAPI* | [**getAssetAddresses**](docs/CardanoAssetsAPI.md#getassetaddresses) | **GET** /assets/{asset}/addresses | Asset addresses
*CardanoAssetsAPI* | [**getAssetHistory**](docs/CardanoAssetsAPI.md#getassethistory) | **GET** /assets/{asset}/history | Asset history
*CardanoAssetsAPI* | [**getAssetTransactions**](docs/CardanoAssetsAPI.md#getassettransactions) | **GET** /assets/{asset}/transactions | Asset transactions
*CardanoAssetsAPI* | [**getAssetTxs**](docs/CardanoAssetsAPI.md#getassettxs) | **GET** /assets/{asset}/txs | Asset transactions
*CardanoAssetsAPI* | [**getAssets**](docs/CardanoAssetsAPI.md#getassets) | **GET** /assets | Assets
*CardanoAssetsAPI* | [**getPolicyAssets**](docs/CardanoAssetsAPI.md#getpolicyassets) | **GET** /assets/policy/{policy_id} | Assets of a specific policy
*CardanoBlocksAPI* | [**getBlock**](docs/CardanoBlocksAPI.md#getblock) | **GET** /blocks/{hash_or_number} | Specific block
*CardanoBlocksAPI* | [**getBlockInEpochInSlot**](docs/CardanoBlocksAPI.md#getblockinepochinslot) | **GET** /blocks/epoch/{epoch_number}/slot/{slot_number} | Specific block in a slot in an epoch
*CardanoBlocksAPI* | [**getBlockInSlot**](docs/CardanoBlocksAPI.md#getblockinslot) | **GET** /blocks/slot/{slot_number} | Specific block in a slot
*CardanoBlocksAPI* | [**getBlockTransactions**](docs/CardanoBlocksAPI.md#getblocktransactions) | **GET** /blocks/{hash_or_number}/txs | Block transactions
*CardanoBlocksAPI* | [**getLatestBlock**](docs/CardanoBlocksAPI.md#getlatestblock) | **GET** /blocks/latest | Latest block
*CardanoBlocksAPI* | [**getNextBlocks**](docs/CardanoBlocksAPI.md#getnextblocks) | **GET** /blocks/{hash_or_number}/next | Listing of next blocks
*CardanoBlocksAPI* | [**getPreviousBlocks**](docs/CardanoBlocksAPI.md#getpreviousblocks) | **GET** /blocks/{hash_or_number}/previous | Listing of previous blocks
*CardanoBlocksAPI* | [**getTransactionsInLatestBlock**](docs/CardanoBlocksAPI.md#gettransactionsinlatestblock) | **GET** /blocks/latest/txs | Latest block transactions
*CardanoEpochsAPI* | [**getActiveStakesForEpoch**](docs/CardanoEpochsAPI.md#getactivestakesforepoch) | **GET** /epochs/{number}/stakes | Stake distribution
*CardanoEpochsAPI* | [**getActiveStakesForEpochAndPool**](docs/CardanoEpochsAPI.md#getactivestakesforepochandpool) | **GET** /epochs/{number}/stakes/{pool_id} | Stake distribution by pool
*CardanoEpochsAPI* | [**getBlocksForEpoch**](docs/CardanoEpochsAPI.md#getblocksforepoch) | **GET** /epochs/{number}/blocks | Block distribution
*CardanoEpochsAPI* | [**getBlocksForEpochAndPool**](docs/CardanoEpochsAPI.md#getblocksforepochandpool) | **GET** /epochs/{number}/blocks/{pool_id} | Block distribution by pool
*CardanoEpochsAPI* | [**getEpoch**](docs/CardanoEpochsAPI.md#getepoch) | **GET** /epochs/{number} | Specific epoch
*CardanoEpochsAPI* | [**getEpochParam**](docs/CardanoEpochsAPI.md#getepochparam) | **GET** /epochs/{number}/parameters | Protocol parameters
*CardanoEpochsAPI* | [**getLatestEpoch**](docs/CardanoEpochsAPI.md#getlatestepoch) | **GET** /epochs/latest | Latest epoch
*CardanoEpochsAPI* | [**getLatestEpochParam**](docs/CardanoEpochsAPI.md#getlatestepochparam) | **GET** /epochs/latest/parameters | Latest epoch protocol parameters
*CardanoEpochsAPI* | [**getNextEpochs**](docs/CardanoEpochsAPI.md#getnextepochs) | **GET** /epochs/{number}/next | Listing of next epochs
*CardanoEpochsAPI* | [**getPreviousEpochs**](docs/CardanoEpochsAPI.md#getpreviousepochs) | **GET** /epochs/{number}/previous | Listing of previous epochs
*CardanoLedgerAPI* | [**getGenesis**](docs/CardanoLedgerAPI.md#getgenesis) | **GET** /genesis | Blockchain genesis
*CardanoMetadataAPI* | [**getTransactionMetadataCborForLabel**](docs/CardanoMetadataAPI.md#gettransactionmetadatacborforlabel) | **GET** /metadata/txs/labels/{label}/cbor | Transaction metadata content in CBOR
*CardanoMetadataAPI* | [**getTransactionMetadataJsonForLabel**](docs/CardanoMetadataAPI.md#gettransactionmetadatajsonforlabel) | **GET** /metadata/txs/labels/{label} | Transaction metadata content in JSON
*CardanoMetadataAPI* | [**getTransactionMetadataLabels**](docs/CardanoMetadataAPI.md#gettransactionmetadatalabels) | **GET** /metadata/txs/labels | Transaction metadata labels
*CardanoNetworkAPI* | [**getNetwork**](docs/CardanoNetworkAPI.md#getnetwork) | **GET** /network | Network information
*CardanoPoolsAPI* | [**getPool**](docs/CardanoPoolsAPI.md#getpool) | **GET** /pools/{pool_id} | Specific stake pool
*CardanoPoolsAPI* | [**getPoolBlocks**](docs/CardanoPoolsAPI.md#getpoolblocks) | **GET** /pools/{pool_id}/blocks | Stake pool blocks
*CardanoPoolsAPI* | [**getPoolDelegators**](docs/CardanoPoolsAPI.md#getpooldelegators) | **GET** /pools/{pool_id}/delegators | Stake pool delegators
*CardanoPoolsAPI* | [**getPoolHistory**](docs/CardanoPoolsAPI.md#getpoolhistory) | **GET** /pools/{pool_id}/history | Stake pool history
*CardanoPoolsAPI* | [**getPoolMetadata**](docs/CardanoPoolsAPI.md#getpoolmetadata) | **GET** /pools/{pool_id}/metadata | Stake pool metadata
*CardanoPoolsAPI* | [**getPoolRelays**](docs/CardanoPoolsAPI.md#getpoolrelays) | **GET** /pools/{pool_id}/relays | Stake pool relays
*CardanoPoolsAPI* | [**getPoolUpdates**](docs/CardanoPoolsAPI.md#getpoolupdates) | **GET** /pools/{pool_id}/updates | Stake pool updates
*CardanoPoolsAPI* | [**getPools**](docs/CardanoPoolsAPI.md#getpools) | **GET** /pools | List of stake pools
*CardanoPoolsAPI* | [**getRetiredPools**](docs/CardanoPoolsAPI.md#getretiredpools) | **GET** /pools/retired | List of retired stake pools
*CardanoPoolsAPI* | [**getRetiringPools**](docs/CardanoPoolsAPI.md#getretiringpools) | **GET** /pools/retiring | List of retiring stake pools
*CardanoScriptsAPI* | [**getScript**](docs/CardanoScriptsAPI.md#getscript) | **GET** /scripts/{script_hash} | Specific script
*CardanoScriptsAPI* | [**getScriptRedeemers**](docs/CardanoScriptsAPI.md#getscriptredeemers) | **GET** /scripts/{script_hash}/redeemers | Redeemers of a specific script
*CardanoScriptsAPI* | [**getScripts**](docs/CardanoScriptsAPI.md#getscripts) | **GET** /scripts | Scripts
*CardanoTransactionsAPI* | [**getTransaction**](docs/CardanoTransactionsAPI.md#gettransaction) | **GET** /txs/{hash} | Specific transaction
*CardanoTransactionsAPI* | [**getTransactionDelegations**](docs/CardanoTransactionsAPI.md#gettransactiondelegations) | **GET** /txs/{hash}/delegations | Transaction delegation certificates
*CardanoTransactionsAPI* | [**getTransactionMetadata**](docs/CardanoTransactionsAPI.md#gettransactionmetadata) | **GET** /txs/{hash}/metadata | Transaction metadata
*CardanoTransactionsAPI* | [**getTransactionMetadataCbor**](docs/CardanoTransactionsAPI.md#gettransactionmetadatacbor) | **GET** /txs/{hash}/metadata/cbor | Transaction metadata in CBOR
*CardanoTransactionsAPI* | [**getTransactionMirs**](docs/CardanoTransactionsAPI.md#gettransactionmirs) | **GET** /txs/{hash}/mirs | Transaction MIRs
*CardanoTransactionsAPI* | [**getTransactionPoolRetires**](docs/CardanoTransactionsAPI.md#gettransactionpoolretires) | **GET** /txs/{hash}/pool_retires | Transaction stake pool retirement certificates
*CardanoTransactionsAPI* | [**getTransactionPoolUpdates**](docs/CardanoTransactionsAPI.md#gettransactionpoolupdates) | **GET** /txs/{hash}/pool_updates | Transaction stake pool registration and update certificates
*CardanoTransactionsAPI* | [**getTransactionRedeemers**](docs/CardanoTransactionsAPI.md#gettransactionredeemers) | **GET** /txs/{hash}/redeemers | Transaction redeemers
*CardanoTransactionsAPI* | [**getTransactionStakes**](docs/CardanoTransactionsAPI.md#gettransactionstakes) | **GET** /txs/{hash}/stakes | Transaction stake addresses certificates
*CardanoTransactionsAPI* | [**getTransactionUtxos**](docs/CardanoTransactionsAPI.md#gettransactionutxos) | **GET** /txs/{hash}/utxos | Transaction UTXOs
*CardanoTransactionsAPI* | [**getTransactionWithdrawals**](docs/CardanoTransactionsAPI.md#gettransactionwithdrawals) | **GET** /txs/{hash}/withdrawals | Transaction withdrawal
*CardanoTransactionsAPI* | [**submitTransaction**](docs/CardanoTransactionsAPI.md#submittransaction) | **POST** /tx/submit | Submit a transaction
*HealthAPI* | [**getApiRoot**](docs/HealthAPI.md#getapiroot) | **GET** / | Root endpoint
*HealthAPI* | [**getCurrentBackendTime**](docs/HealthAPI.md#getcurrentbackendtime) | **GET** /health/clock | Current backend time
*HealthAPI* | [**getHealth**](docs/HealthAPI.md#gethealth) | **GET** /health | Backend health status
*IPFSAddAPI* | [**add**](docs/IPFSAddAPI.md#add) | **POST** /ipfs/add | Add a file to IPFS
*IPFSGatewayAPI* | [**callGet**](docs/IPFSGatewayAPI.md#callget) | **GET** /ipfs/gateway/{IPFS_path} | Relay to an IPFS gateway
*IPFSPinsAPI* | [**getPinList**](docs/IPFSPinsAPI.md#getpinlist) | **GET** /ipfs/pin/list/ | List pinned objects
*IPFSPinsAPI* | [**getPinListByIpfsPath**](docs/IPFSPinsAPI.md#getpinlistbyipfspath) | **GET** /ipfs/pin/list/{IPFS_path} | Get details about pinned object
*IPFSPinsAPI* | [**pinAdd**](docs/IPFSPinsAPI.md#pinadd) | **POST** /ipfs/pin/add/{IPFS_path} | Pin an object
*IPFSPinsAPI* | [**removePin**](docs/IPFSPinsAPI.md#removepin) | **POST** /ipfs/pin/remove/{IPFS_path} | 
*MetricsAPI* | [**getMetrics**](docs/MetricsAPI.md#getmetrics) | **GET** /metrics/ | Blockfrost usage metrics
*MetricsAPI* | [**getMetricsEndpoints**](docs/MetricsAPI.md#getmetricsendpoints) | **GET** /metrics/endpoints | Blockfrost endpoint usage metrics
*NutLinkAPI* | [**getAddress**](docs/NutLinkAPI.md#getaddress) | **GET** /nutlink/{address} | 
*NutLinkAPI* | [**getAddressTickers**](docs/NutLinkAPI.md#getaddresstickers) | **GET** /nutlink/{address}/tickers | 
*NutLinkAPI* | [**getTickerRecordsByAddressAndTicker**](docs/NutLinkAPI.md#gettickerrecordsbyaddressandticker) | **GET** /nutlink/{address}/tickers/{ticker} | 
*NutLinkAPI* | [**getTickerRecordsByTicker**](docs/NutLinkAPI.md#gettickerrecordsbyticker) | **GET** /nutlink/tickers/{ticker} | 


## Documentation For Models

 - [AccountAddressesAsset](docs/AccountAddressesAsset.md)
 - [AccountAddressesContent](docs/AccountAddressesContent.md)
 - [AccountContent](docs/AccountContent.md)
 - [AccountDelegationContent](docs/AccountDelegationContent.md)
 - [AccountHistoryContent](docs/AccountHistoryContent.md)
 - [AccountMirContent](docs/AccountMirContent.md)
 - [AccountRegistrationContent](docs/AccountRegistrationContent.md)
 - [AccountRewardContent](docs/AccountRewardContent.md)
 - [AccountWithdrawalContent](docs/AccountWithdrawalContent.md)
 - [AddressContent](docs/AddressContent.md)
 - [AddressContentTotal](docs/AddressContentTotal.md)
 - [AddressTransactionsContent](docs/AddressTransactionsContent.md)
 - [AddressUtxoContent](docs/AddressUtxoContent.md)
 - [Asset](docs/Asset.md)
 - [AssetAddress](docs/AssetAddress.md)
 - [AssetHistory](docs/AssetHistory.md)
 - [AssetMetadata](docs/AssetMetadata.md)
 - [AssetPolicy](docs/AssetPolicy.md)
 - [AssetTransaction](docs/AssetTransaction.md)
 - [BlockContent](docs/BlockContent.md)
 - [EpochContent](docs/EpochContent.md)
 - [EpochParamContent](docs/EpochParamContent.md)
 - [EpochStakeContent](docs/EpochStakeContent.md)
 - [EpochStakePoolContent](docs/EpochStakePoolContent.md)
 - [GenesisContent](docs/GenesisContent.md)
 - [Metric](docs/Metric.md)
 - [MetricsEndpoint](docs/MetricsEndpoint.md)
 - [Network](docs/Network.md)
 - [NetworkStake](docs/NetworkStake.md)
 - [NetworkSupply](docs/NetworkSupply.md)
 - [NutlinkAddress](docs/NutlinkAddress.md)
 - [NutlinkAddressTicker](docs/NutlinkAddressTicker.md)
 - [NutlinkTickersTicker](docs/NutlinkTickersTicker.md)
 - [Pool](docs/Pool.md)
 - [PoolDelegation](docs/PoolDelegation.md)
 - [PoolDelegator](docs/PoolDelegator.md)
 - [PoolHistory](docs/PoolHistory.md)
 - [PoolListRetire](docs/PoolListRetire.md)
 - [PoolMetadata](docs/PoolMetadata.md)
 - [PoolRelay](docs/PoolRelay.md)
 - [PoolUpdat](docs/PoolUpdat.md)
 - [Script](docs/Script.md)
 - [ScriptRedeemer](docs/ScriptRedeemer.md)
 - [TxContent](docs/TxContent.md)
 - [TxContentDelegation](docs/TxContentDelegation.md)
 - [TxContentMetadata](docs/TxContentMetadata.md)
 - [TxContentMetadataCbor](docs/TxContentMetadataCbor.md)
 - [TxContentMir](docs/TxContentMir.md)
 - [TxContentOutputAmount](docs/TxContentOutputAmount.md)
 - [TxContentPoolCert](docs/TxContentPoolCert.md)
 - [TxContentPoolRetir](docs/TxContentPoolRetir.md)
 - [TxContentRedeemer](docs/TxContentRedeemer.md)
 - [TxContentStakeAddr](docs/TxContentStakeAddr.md)
 - [TxContentUtxo](docs/TxContentUtxo.md)
 - [TxContentUtxoAmount](docs/TxContentUtxoAmount.md)
 - [TxContentUtxoInputs](docs/TxContentUtxoInputs.md)
 - [TxContentUtxoOutputs](docs/TxContentUtxoOutputs.md)
 - [TxContentWithdrawal](docs/TxContentWithdrawal.md)
 - [TxMetadataLabel](docs/TxMetadataLabel.md)
 - [TxMetadataLabelCbor](docs/TxMetadataLabelCbor.md)
 - [TxMetadataLabelJson](docs/TxMetadataLabelJson.md)


## Documentation For Authorization


## ApiKeyAuth

- **Type**: API key
- **API key parameter name**: project_id
- **Location**: HTTP header


## Author

contact@blockfrost.io

