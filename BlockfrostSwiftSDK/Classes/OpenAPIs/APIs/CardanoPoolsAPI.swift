//
// CardanoPoolsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoPoolsAPI: BaseService {
    /**
     Specific stake pool

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPool(
        poolId: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<Pool, Error>) -> Void
    ) -> APIRequest {
        getPoolWithRequestBuilder(poolId: poolId)
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
     Specific stake pool
     - GET /pools/{pool_id}
     - Pool information.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - returns: RequestBuilder<Pool>
     */
    open func getPoolWithRequestBuilder(poolId: String) -> RequestBuilder<Pool> {
        var localVariablePath = "/pools/{pool_id}"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Pool>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool blocks

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolBlocks(
        poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getPoolBlocksWithRequestBuilder(poolId: poolId, count: count, page: page, order: order)
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
     Stake pool blocks. Fetches all paged records.

      - parameter poolId: (path) Bech32 or hexadecimal pool ID.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPoolBlocksAll(
        poolId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPoolBlocks(poolId: poolId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake pool blocks
     - GET /pools/{pool_id}/blocks
     - List of stake pools blocks.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    open func getPoolBlocksWithRequestBuilder(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        var localVariablePath = "/pools/{pool_id}/blocks"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
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

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool delegators

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolDelegators(
        poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolDelegator], Error>) -> Void
    ) -> APIRequest {
        getPoolDelegatorsWithRequestBuilder(poolId: poolId, count: count, page: page, order: order)
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
     Stake pool delegators. Fetches all paged records.

      - parameter poolId: (path) Bech32 or hexadecimal pool ID.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPoolDelegatorsAll(
        poolId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolDelegator], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PoolDelegator>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPoolDelegators(poolId: poolId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake pool delegators
     - GET /pools/{pool_id}/delegators
     - List of current stake pools delegators.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PoolDelegator]>
     */
    open func getPoolDelegatorsWithRequestBuilder(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PoolDelegator]> {
        var localVariablePath = "/pools/{pool_id}/delegators"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<[PoolDelegator]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool history

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolHistory(
        poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolHistory], Error>) -> Void
    ) -> APIRequest {
        getPoolHistoryWithRequestBuilder(poolId: poolId, count: count, page: page, order: order)
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
     Stake pool history. Fetches all paged records.

      - parameter poolId: (path) Bech32 or hexadecimal pool ID.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPoolHistoryAll(
        poolId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolHistory], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PoolHistory>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPoolHistory(poolId: poolId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake pool history
     - GET /pools/{pool_id}/history
     - History of stake pool parameters over epochs.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PoolHistory]>
     */
    open func getPoolHistoryWithRequestBuilder(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PoolHistory]> {
        var localVariablePath = "/pools/{pool_id}/history"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<[PoolHistory]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool metadata

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolMetadata(
        poolId: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<PoolMetadata?, Error>) -> Void
    ) -> APIRequest {
        getPoolMetadataWithRequestBuilder(poolId: poolId)
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
     Stake pool metadata
     - GET /pools/{pool_id}/metadata
     - Stake pool registration metadata.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - returns: RequestBuilder<PoolMetadata?>
     */
    open func getPoolMetadataWithRequestBuilder(poolId: String) -> RequestBuilder<PoolMetadata?> {
        var localVariablePath = "/pools/{pool_id}/metadata"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PoolMetadata?>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool relays

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolRelays(
        poolId: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolRelay], Error>) -> Void
    ) -> APIRequest {
        getPoolRelaysWithRequestBuilder(poolId: poolId)
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
     Stake pool relays
     - GET /pools/{pool_id}/relays
     - Relays of a stake pool.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - returns: RequestBuilder<[PoolRelay]>
     */
    open func getPoolRelaysWithRequestBuilder(poolId: String) -> RequestBuilder<[PoolRelay]> {
        var localVariablePath = "/pools/{pool_id}/relays"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[PoolRelay]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Stake pool updates

     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPoolUpdates(
        poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolUpdate], Error>) -> Void
    ) -> APIRequest {
        getPoolUpdatesWithRequestBuilder(poolId: poolId, count: count, page: page, order: order)
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
     Stake pool updates. Fetches all paged records.

      - parameter poolId: (path) Bech32 or hexadecimal pool ID.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPoolUpdatesAll(
        poolId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolUpdate], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PoolUpdate>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPoolUpdates(poolId: poolId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake pool updates
     - GET /pools/{pool_id}/updates
     - List of certificate updates to the stake pool.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter poolId: (path) Bech32 or hexadecimal pool ID.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PoolUpdat]>
     */
    open func getPoolUpdatesWithRequestBuilder(poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PoolUpdate]> {
        var localVariablePath = "/pools/{pool_id}/updates"
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<[PoolUpdate]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     List of stake pools

     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPools(
        count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getPoolsWithRequestBuilder(count: count, page: page, order: order)
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
     List of stake pools. Fetches all paged records.

      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPoolsAll(
        order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPools(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     List of stake pools
     - GET /pools
     - List of registered stake pools.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    open func getPoolsWithRequestBuilder(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        let localVariablePath = "/pools"
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

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     List of retired stake pools

     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getRetiredPools(
        count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolListRetire], Error>) -> Void
    ) -> APIRequest {
        getRetiredPoolsWithRequestBuilder(count: count, page: page, order: order)
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
     List of retired stake pools. Fetches all paged records.

      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getRetiredPoolsAll(
        order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolListRetire], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PoolListRetire>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getRetiredPools(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     List of retired stake pools
     - GET /pools/retired
     - List of already retired pools.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PoolListRetire]>
     */
    open func getRetiredPoolsWithRequestBuilder(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PoolListRetire]> {
        let localVariablePath = "/pools/retired"
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

        let localVariableRequestBuilder: RequestBuilder<[PoolListRetire]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     List of retiring stake pools

     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getRetiringPools(
        count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolListRetire], Error>) -> Void
    ) -> APIRequest {
        getRetiringPoolsWithRequestBuilder(count: count, page: page, order: order)
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
     List of retiring stake pools. Fetches all paged records.

      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getRetiringPoolsAll(
        order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PoolListRetire], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PoolListRetire>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getRetiringPools(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     List of retiring stake pools
     - GET /pools/retiring
     - List of stake pools retiring in the upcoming epochs
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PoolListRetire]>
     */
    open func getRetiringPoolsWithRequestBuilder(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PoolListRetire]> {
        let localVariablePath = "/pools/retiring"
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

        let localVariableRequestBuilder: RequestBuilder<[PoolListRetire]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }
}
