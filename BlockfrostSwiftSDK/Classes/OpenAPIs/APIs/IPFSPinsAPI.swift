//
// IPFSPinsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class IPFSPinsAPI: BaseService {
    public override init(config: BlockfrostConfig?) {
        super.init(config: config ?? BlockfrostConfig.ipfsDefault())
    }
    
    /**
     List pinned objects

     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPinList(
        count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[PinItem], Error>) -> Void
    ) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            getPinListWithRequestBuilder(count: count, page: page, order: order)
        }
    }

    /**
     List pinned objects. Fetches all paged records.

      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getPinListAll(
        order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[PinItem], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<PinItem>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getPinList(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     List pinned objects

     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: [GetPinList200Response]
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func getPinListAsync(
            count: Int? = nil, page: Int? = nil, order: SortOrder? = nil
    ) async throws -> [PinItem] {
        try await asyncWrapper {
            getPinListWithRequestBuilder(count: count, page: page, order: order)
        }
    }

    /**
    List pinned objects. Fetches all paged records.

     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
     */
    open func getPinListAllAsync(
            order: SortOrder? = nil,
            apiResponseQueue: DispatchQueue? = nil,
            batchSize: Int? = nil
    ) async throws -> [PinItem] {
        let loader = PageLoader<PinItem>(batchSize: batchSize ?? config.batchSize)
        return try await loader.loadAllAsync({ (count, page, compl) in
            let _ = self.getPinList(count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        })
    }

    /**
     List pinned objects
     - GET /ipfs/pin/list/
     - List objects pinned to local storage
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[PinItem]>
     */
    open func getPinListWithRequestBuilder(count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[PinItem]> {
        let localVariablePath = "/ipfs/pin/list/"
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

        let localVariableRequestBuilder: RequestBuilder<[PinItem]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Get details about pinned object

     - parameter iPFSPath: (path)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getPinListByIpfsPath(
        iPFSPath: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<PinItem, Error>) -> Void
    ) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            getPinListByIpfsPathWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**
     Get details about pinned object

     - parameter iPFSPath: (path)
     - returns: GetPinListByIpfsPath200Response
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func getPinListByIpfsPathAsync(
            iPFSPath: String
    ) async throws -> PinItem {
        try await asyncWrapper {
            getPinListByIpfsPathWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**
     Get details about pinned object
     - GET /ipfs/pin/list/{IPFS_path}
     - Get information about locally pinned IPFS object
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter iPFSPath: (path)
     - returns: RequestBuilder<PinItem>
     */
    open func getPinListByIpfsPathWithRequestBuilder(iPFSPath: String) -> RequestBuilder<PinItem> {
        var localVariablePath = "/ipfs/pin/list/{IPFS_path}"
        let iPFSPathPreEscape = "\(APIHelper.mapValueToPathItem(iPFSPath))"
        let iPFSPathPostEscape = iPFSPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{IPFS_path}", with: iPFSPathPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PinItem>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Pin an object

     - parameter iPFSPath: (path)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func pinAdd(
        iPFSPath: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<PinResponse, Error>) -> Void
    ) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            pinAddWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**
     Pin an object

     - parameter iPFSPath: (path)
     - returns: PinAdd200Response
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func pinAddAsync(
            iPFSPath: String
    ) async throws -> PinResponse {
        try await asyncWrapper {
            pinAddWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**
     Pin an object
     - POST /ipfs/pin/add/{IPFS_path}
     - Pinned objects are counted in your user storage quota.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter iPFSPath: (path)
     - returns: RequestBuilder<PinResponse>
     */
    open func pinAddWithRequestBuilder(iPFSPath: String) -> RequestBuilder<PinResponse> {
        var localVariablePath = "/ipfs/pin/add/{IPFS_path}"
        let iPFSPathPreEscape = "\(APIHelper.mapValueToPathItem(iPFSPath))"
        let iPFSPathPostEscape = iPFSPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{IPFS_path}", with: iPFSPathPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PinResponse>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**

     - parameter iPFSPath: (path)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func removePin(
        iPFSPath: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<PinResponse, Error>) -> Void
    ) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            removePinWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**

     - parameter iPFSPath: (path)
     - returns: RemovePin200Response
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func removePinAsync(
            iPFSPath: String
    ) async throws -> PinResponse {
        try await asyncWrapper {
            removePinWithRequestBuilder(iPFSPath: iPFSPath)
        }
    }

    /**
     - POST /ipfs/pin/remove/{IPFS_path}
     - Remove pinned objects from local storage
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter iPFSPath: (path)
     - returns: RequestBuilder<PinResponse>
     */
    open func removePinWithRequestBuilder(iPFSPath: String) -> RequestBuilder<PinResponse> {
        var localVariablePath = "/ipfs/pin/remove/{IPFS_path}"
        let iPFSPathPreEscape = "\(APIHelper.mapValueToPathItem(iPFSPath))"
        let iPFSPathPostEscape = iPFSPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{IPFS_path}", with: iPFSPathPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PinResponse>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }
}
