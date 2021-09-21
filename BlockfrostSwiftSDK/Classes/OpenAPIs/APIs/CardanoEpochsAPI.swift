//
// CardanoEpochsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoEpochsAPI: BaseService {
    /**
     Stake distribution

     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getActiveStakesForEpoch(
        number: Int, count: Int? = nil, page: Int? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochStakeContent], Error>) -> Void
    ) -> APIRequest {
        getActiveStakesForEpochWithRequestBuilder(number: number, count: count, page: page)
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
     Stake distribution. Fetches all paged records.

      - parameter number: (path) Number of the epoch
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getActiveStakesForEpochAll(
        number: Int,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochStakeContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<EpochStakeContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getActiveStakesForEpoch(number: number, count: count, page: page, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake distribution
     - GET /epochs/{number}/stakes
     - Return the active stake distribution for the specified epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - returns: RequestBuilder<[EpochStakeContent]>
     */
    open func getActiveStakesForEpochWithRequestBuilder(number: Int, count: Int? = nil, page: Int? = nil) -> RequestBuilder<[EpochStakeContent]> {
        var localVariablePath = "/epochs/{number}/stakes"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[EpochStakeContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Stake distribution by pool

     - parameter number: (path) Number of the epoch
     - parameter poolId: (path) Stake pool ID to filter
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getActiveStakesForEpochAndPool(
        number: Int, poolId: String, count: Int? = nil, page: Int? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochStakePoolContent], Error>) -> Void
    ) -> APIRequest {
        getActiveStakesForEpochAndPoolWithRequestBuilder(number: number, poolId: poolId, count: count, page: page)
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
     Stake distribution by pool. Fetches all paged records.

      - parameter number: (path) Number of the epoch
      - parameter poolId: (path) Stake pool ID to filter
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getActiveStakesForEpochAndPoolAll(
        number: Int, poolId: String,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochStakePoolContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<EpochStakePoolContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getActiveStakesForEpochAndPool(number: number, poolId: poolId, count: count, page: page, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Stake distribution by pool
     - GET /epochs/{number}/stakes/{pool_id}
     - Return the active stake distribution for the epoch specified by stake pool.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - parameter poolId: (path) Stake pool ID to filter
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - returns: RequestBuilder<[EpochStakePoolContent]>
     */
    open func getActiveStakesForEpochAndPoolWithRequestBuilder(number: Int, poolId: String, count: Int? = nil, page: Int? = nil) -> RequestBuilder<[EpochStakePoolContent]> {
        var localVariablePath = "/epochs/{number}/stakes/{pool_id}"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let poolIdPreEscape = "\(APIHelper.mapValueToPathItem(poolId))"
        let poolIdPostEscape = poolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{pool_id}", with: poolIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[EpochStakePoolContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Block distribution

     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getBlocksForEpoch(
        number: Int, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getBlocksForEpochWithRequestBuilder(number: number, count: count, page: page, order: order)
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
     Block distribution. Fetches all paged records.

      - parameter number: (path) Number of the epoch
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getBlocksForEpochAll(
        number: Int, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getBlocksForEpoch(number: number, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Block distribution
     - GET /epochs/{number}/blocks
     - Return the blocks minted for the epoch specified.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    open func getBlocksForEpochWithRequestBuilder(number: Int, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        var localVariablePath = "/epochs/{number}/blocks"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
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
     Block distribution by pool

     - parameter number: (path) Number of the epoch
     - parameter poolId: (path) Stake pool ID to filter
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getBlocksForEpochAndPool(
        number: Int, poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getBlocksForEpochAndPoolWithRequestBuilder(number: number, poolId: poolId, count: count, page: page, order: order)
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
     Block distribution by pool. Fetches all paged records.

      - parameter number: (path) Number of the epoch
      - parameter poolId: (path) Stake pool ID to filter
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getBlocksForEpochAndPoolAll(
        number: Int, poolId: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getBlocksForEpochAndPool(number: number, poolId: poolId, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Block distribution by pool
     - GET /epochs/{number}/blocks/{pool_id}
     - Return the block minted for the epoch specified by stake pool.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - parameter poolId: (path) Stake pool ID to filter
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    open func getBlocksForEpochAndPoolWithRequestBuilder(number: Int, poolId: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        var localVariablePath = "/epochs/{number}/blocks/{pool_id}"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
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

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Specific epoch

     - parameter number: (path) Number of the epoch
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getEpoch(
        number: Int,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<EpochContent, Error>) -> Void
    ) -> APIRequest {
        getEpochWithRequestBuilder(number: number)
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
     Specific epoch
     - GET /epochs/{number}
     - Return the content of the requested epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - returns: RequestBuilder<EpochContent>
     */
    open func getEpochWithRequestBuilder(number: Int) -> RequestBuilder<EpochContent> {
        var localVariablePath = "/epochs/{number}"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<EpochContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Protocol parameters

     - parameter number: (path) Number of the epoch
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getEpochParam(
        number: Int,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<EpochParamContent, Error>) -> Void
    ) -> APIRequest {
        getEpochParamWithRequestBuilder(number: number)
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
     Protocol parameters
     - GET /epochs/{number}/parameters
     - Return the protocol parameters for the epoch specified.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - returns: RequestBuilder<EpochParamContent>
     */
    open func getEpochParamWithRequestBuilder(number: Int) -> RequestBuilder<EpochParamContent> {
        var localVariablePath = "/epochs/{number}/parameters"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<EpochParamContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Latest epoch

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getLatestEpoch(apiResponseQueue: DispatchQueue? = nil, completion: @escaping (_ result: Swift.Result<EpochContent, Error>) -> Void) -> APIRequest {
        getLatestEpochWithRequestBuilder()
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
     Latest epoch
     - GET /epochs/latest
     - Return the information about the latest, therefore current, epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - returns: RequestBuilder<EpochContent>
     */
    open func getLatestEpochWithRequestBuilder() -> RequestBuilder<EpochContent> {
        let localVariablePath = "/epochs/latest"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<EpochContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Latest epoch protocol parameters

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getLatestEpochParam(apiResponseQueue: DispatchQueue? = nil, completion: @escaping (_ result: Swift.Result<EpochParamContent, Error>) -> Void) -> APIRequest {
        getLatestEpochParamWithRequestBuilder()
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
     Latest epoch protocol parameters
     - GET /epochs/latest/parameters
     - Return the protocol parameters for the latest epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - returns: RequestBuilder<EpochParamContent>
     */
    open func getLatestEpochParamWithRequestBuilder() -> RequestBuilder<EpochParamContent> {
        let localVariablePath = "/epochs/latest/parameters"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<EpochParamContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Listing of next epochs

     - parameter number: (path) Number of the requested epoch.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getNextEpochs(
        number: Int, count: Int? = nil, page: Int? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochContent], Error>) -> Void
    ) -> APIRequest {
        getNextEpochsWithRequestBuilder(number: number, count: count, page: page)
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
     Listing of next epochs. Fetches all paged records.

      - parameter number: (path) Number of the requested epoch.
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getNextEpochsAll(
        number: Int,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<EpochContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getNextEpochs(number: number, count: count, page: page, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Listing of next epochs
     - GET /epochs/{number}/next
     - Return the list of epochs following a specific epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the requested epoch.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - returns: RequestBuilder<[EpochContent]>
     */
    open func getNextEpochsWithRequestBuilder(number: Int, count: Int? = nil, page: Int? = nil) -> RequestBuilder<[EpochContent]> {
        var localVariablePath = "/epochs/{number}/next"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[EpochContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Listing of previous epochs

     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results (optional, default to 1)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPreviousEpochs(
        number: Int, count: Int? = nil, page: Int? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochContent], Error>) -> Void
    ) -> APIRequest {
        getPreviousEpochsWithRequestBuilder(number: number, count: count, page: page)
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
     Listing of previous epochs. Fetches all paged records.

      - parameter number: (path) Number of the epoch
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPreviousEpochsAll(
        number: Int,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[EpochContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<EpochContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPreviousEpochs(number: number, count: count, page: page, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Listing of previous epochs
     - GET /epochs/{number}/previous
     - Return the list of epochs preceding a specific epoch.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter number: (path) Number of the epoch
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results (optional, default to 1)
     - returns: RequestBuilder<[EpochContent]>
     */
    open func getPreviousEpochsWithRequestBuilder(number: Int, count: Int? = nil, page: Int? = nil) -> RequestBuilder<[EpochContent]> {
        var localVariablePath = "/epochs/{number}/previous"
        let numberPreEscape = "\(APIHelper.mapValueToPathItem(number))"
        let numberPostEscape = numberPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{number}", with: numberPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[EpochContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
