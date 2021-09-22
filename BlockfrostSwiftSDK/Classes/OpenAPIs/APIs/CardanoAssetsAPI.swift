//
// CardanoAssetsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoAssetsAPI: BaseService {
    /**
     Specific asset

     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAsset(
        asset: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<Asset, Error>) -> Void
    ) -> APIRequest {
        getAssetWithRequestBuilder(asset: asset)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Specific asset
     - GET /assets/{asset}
     - Information about a specific asset
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - returns: RequestBuilder<Asset>
     */
    open func getAssetWithRequestBuilder(asset: String) -> RequestBuilder<Asset> {
        var localVariablePath = "/assets/{asset}"
        let assetPreEscape = "\(APIHelper.mapValueToPathItem(asset))"
        let assetPostEscape = assetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{asset}", with: assetPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Asset>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Asset addresses

     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAssetAddresses(
        asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetAddress], Error>) -> Void
    ) -> APIRequest {
        getAssetAddressesWithRequestBuilder(asset: asset, count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Asset addresses. Fetches all paged records.

      - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAssetAddressesAll(
        asset: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetAddress], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AssetAddress>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAssetAddresses(asset: asset, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Asset addresses
     - GET /assets/{asset}/addresses
     - List of a addresses containing a specific asset
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[AssetAddress]>
     */
    open func getAssetAddressesWithRequestBuilder(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AssetAddress]> {
        var localVariablePath = "/assets/{asset}/addresses"
        let assetPreEscape = "\(APIHelper.mapValueToPathItem(asset))"
        let assetPostEscape = assetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{asset}", with: assetPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AssetAddress]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Asset history

     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAssetHistory(
        asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetHistory], Error>) -> Void
    ) -> APIRequest {
        getAssetHistoryWithRequestBuilder(asset: asset, count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Asset history. Fetches all paged records.

      - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAssetHistoryAll(
        asset: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetHistory], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AssetHistory>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAssetHistory(asset: asset, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Asset history
     - GET /assets/{asset}/history
     - History of a specific asset
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[AssetHistory]>
     */
    open func getAssetHistoryWithRequestBuilder(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AssetHistory]> {
        var localVariablePath = "/assets/{asset}/history"
        let assetPreEscape = "\(APIHelper.mapValueToPathItem(asset))"
        let assetPostEscape = assetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{asset}", with: assetPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AssetHistory]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Asset transactions

     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAssetTransactions(
        asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetTransaction], Error>) -> Void
    ) -> APIRequest {
        getAssetTransactionsWithRequestBuilder(asset: asset, count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Asset transactions. Fetches all paged records.

      - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAssetTransactionsAll(
        asset: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetTransaction], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AssetTransaction>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAssetTransactions(asset: asset, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Asset transactions
     - GET /assets/{asset}/transactions
     - List of a specific asset transactions
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[AssetTransaction]>
     */
    open func getAssetTransactionsWithRequestBuilder(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AssetTransaction]> {
        var localVariablePath = "/assets/{asset}/transactions"
        let assetPreEscape = "\(APIHelper.mapValueToPathItem(asset))"
        let assetPostEscape = assetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{asset}", with: assetPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AssetTransaction]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Asset transactions

     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open func getAssetTxs(
        asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getAssetTxsWithRequestBuilder(asset: asset, count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Asset transactions. Fetches all paged records.

      - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAssetTxsAll(
        asset: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAssetTxs(asset: asset, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Asset transactions
     - GET /assets/{asset}/txs
     - List of a specific asset transactions
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter asset: (path) Concatenation of the policy_id and hex-encoded asset_name
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open func getAssetTxsWithRequestBuilder(asset: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        var localVariablePath = "/assets/{asset}/txs"
        let assetPreEscape = "\(APIHelper.mapValueToPathItem(asset))"
        let assetPostEscape = assetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{asset}", with: assetPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[String]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Assets

     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAssets(
        count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetRecord], Error>) -> Void
    ) -> APIRequest {
        getAssetsWithRequestBuilder(count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Assets. Fetches all paged records.

      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAssetsAll(
        order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetRecord], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AssetRecord>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAssets(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Assets
     - GET /assets
     - List of assets.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[Asset]>
     */
    open func getAssetsWithRequestBuilder(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AssetRecord]> {
        let localVariablePath = "/assets"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AssetRecord]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Assets of a specific policy

     - parameter policyId: (path) Specific policy_id
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPolicyAssets(
        policyId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetPolicy], Error>) -> Void
    ) -> APIRequest {
        getPolicyAssetsWithRequestBuilder(policyId: policyId, count: count, page: page, order: order)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    completion(.success(response.body!))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Assets of a specific policy. Fetches all paged records.

      - parameter policyId: (path) Specific policy_id
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPolicyAssetsAll(
        policyId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AssetPolicy], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AssetPolicy>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPolicyAssets(policyId: policyId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Assets of a specific policy
     - GET /assets/policy/{policy_id}
     - List of asset minted under a specific policy
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter policyId: (path) Specific policy_id
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[AssetPolicy]>
     */
    open func getPolicyAssetsWithRequestBuilder(policyId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AssetPolicy]> {
        var localVariablePath = "/assets/policy/{policy_id}"
        let policyIdPreEscape = "\(APIHelper.mapValueToPathItem(policyId))"
        let policyIdPostEscape = policyIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{policy_id}", with: policyIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AssetPolicy]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
