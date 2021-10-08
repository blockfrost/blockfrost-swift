//
// CardanoAddressesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoAddressesAPI: BaseService {
    /**
     Specific address

     - parameter address: (path) Bech32 address.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAddress(
        address: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<AddressContent, Error>) -> Void
    ) -> APIRequest {
        getAddressWithRequestBuilder(address: address)
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
     Specific address
     - GET /addresses/{address}
     - Obtain information about a specific address.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter address: (path) Bech32 address.
     - returns: RequestBuilder<AddressContent>
     */
    open func getAddressWithRequestBuilder(address: String) -> RequestBuilder<AddressContent> {
        var localVariablePath = "/addresses/{address}"
        let addressPreEscape = "\(APIHelper.mapValueToPathItem(address))"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddressContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Address details

     - parameter address: (path) Bech32 address.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAddressDetails(
        address: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<AddressContentTotal, Error>) -> Void
    ) -> APIRequest {
        getAddressDetailsWithRequestBuilder(address: address)
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
     Address details
     - GET /addresses/{address}/total
     - Obtain details about an address.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter address: (path) Bech32 address.
     - returns: RequestBuilder<AddressContentTotal>
     */
    open func getAddressDetailsWithRequestBuilder(address: String) -> RequestBuilder<AddressContentTotal> {
        var localVariablePath = "/addresses/{address}/total"
        let addressPreEscape = "\(APIHelper.mapValueToPathItem(address))"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddressContentTotal>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Address transactions

     - parameter address: (path) Bech32 address.
     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter from: (query) The block number and optionally also index from which (inclusive) to start search for results, concatenated using colon. Has to be lower than or equal to &#x60;to&#x60; parameter.  (optional)
     - parameter to: (query) The block number and optionally also index where (inclusive) to end the search for results, concatenated using colon. Has to be higher than or equal to &#x60;from&#x60; parameter.  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAddressTransactions(
        address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, from: String? = nil, to: String? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AddressTransactionsContent], Error>) -> Void
    ) -> APIRequest {
        getAddressTransactionsWithRequestBuilder(address: address, count: count, page: page, order: order, from: from, to: to)
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
     Address transactions. Fetches all paged records.

      - parameter address: (path) Bech32 address.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter from: (query) The block number and optionally also index from which (inclusive) to start search for results, concatenated using colon. Has to be lower than or equal to &#x60;to&#x60; parameter.  (optional)
      - parameter to: (query) The block number and optionally also index where (inclusive) to end the search for results, concatenated using colon. Has to be higher than or equal to &#x60;from&#x60; parameter.  (optional)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAddressTransactionsAll(
        address: String, order: SortOrder? = nil, from: String? = nil, to: String? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AddressTransactionsContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AddressTransactionsContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAddressTransactions(address: address, count: count, page: page, order: order, from: from, to: to, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Address transactions
     - GET /addresses/{address}/transactions
     - Transactions on the address.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter address: (path) Bech32 address.
     - parameter count: (query) The numbers of pools per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter from: (query) The block number and optionally also index from which (inclusive) to start search for results, concatenated using colon. Has to be lower than or equal to &#x60;to&#x60; parameter.  (optional)
     - parameter to: (query) The block number and optionally also index where (inclusive) to end the search for results, concatenated using colon. Has to be higher than or equal to &#x60;from&#x60; parameter.  (optional)
     - returns: RequestBuilder<[AddressTransactionsContent]>
     */
    open func getAddressTransactionsWithRequestBuilder(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil, from: String? = nil, to: String? = nil) -> RequestBuilder<[AddressTransactionsContent]> {
        var localVariablePath = "/addresses/{address}/transactions"
        let addressPreEscape = "\(APIHelper.mapValueToPathItem(address))"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
            "from": from?.encodeToJSON(),
            "to": to?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[AddressTransactionsContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Address transactions

     - parameter address: (path) Bech32 address.
     - parameter count: (query) The number of transactions per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open func getAddressTxs(
        address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        getAddressTxsWithRequestBuilder(address: address, count: count, page: page, order: order)
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
     Address transactions. Fetches all paged records.

      - parameter address: (path) Bech32 address.
      - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAddressTxsAll(
        address: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[String], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<String>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAddressTxs(address: address, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Address transactions
     - GET /addresses/{address}/txs
     - Transactions on the address.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter address: (path) Bech32 address.
     - parameter count: (query) The number of transactions per page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[String]>
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open func getAddressTxsWithRequestBuilder(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[String]> {
        var localVariablePath = "/addresses/{address}/txs"
        let addressPreEscape = "\(APIHelper.mapValueToPathItem(address))"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
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
     Address UTXOs

     - parameter address: (path) Bech32 address.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getAddressUtxos(
        address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[AddressUtxoContent], Error>) -> Void
    ) -> APIRequest {
        getAddressUtxosWithRequestBuilder(address: address, count: count, page: page, order: order)
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
     Address UTXOs. Fetches all paged records.

      - parameter address: (path) Bech32 address.
      - parameter order: (query) Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
      - parameter apiResponseQueue: The queue on which api response is dispatched.
      - parameter batchSize: Number of concurrent requests for page download. If nil, config.batchSize is used.
      - parameter completion: completion handler to receive the result
      */
    open func getAddressUtxosAll(
        address: String, order: SortOrder? = nil,
        apiResponseQueue: DispatchQueue? = nil,
        batchSize: Int? = nil,
        completion: @escaping (_ result: Swift.Result<[AddressUtxoContent], Error>) -> Void
    ) -> APIRequest {
        let loader = PageLoader<AddressUtxoContent>(batchSize: batchSize ?? config.batchSize)
        loader.loadAll({ count, page, compl in
            _ = self.getAddressUtxos(address: address, count: count, page: page, order: order, apiResponseQueue: apiResponseQueue, completion: compl)
        }, completion: { compl in
            completion(compl)
        })
        return APILoaderRequest(loader: loader)
    }

    /**
     Address UTXOs
     - GET /addresses/{address}/utxos
     - UTXOs of the address.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter address: (path) Bech32 address.
     - parameter count: (query) The number of results displayed on one page. (optional, default to 100)
     - parameter page: (query) The page number for listing the results. (optional, default to 1)
     - parameter order: (query) Ordered by tx index in the block. The ordering of items from the point of view of the blockchain, not the page listing itself. By default, we return oldest first, newest last.  (optional, default to .asc)
     - returns: RequestBuilder<[AddressUtxoContent]>
     */
    open func getAddressUtxosWithRequestBuilder(address: String, count: Int? = nil, page: Int? = nil, order: SortOrder? = nil) -> RequestBuilder<[AddressUtxoContent]> {
        var localVariablePath = "/addresses/{address}/utxos"
        let addressPreEscape = "\(APIHelper.mapValueToPathItem(address))"
        let addressPostEscape = addressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{address}", with: addressPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<[AddressUtxoContent]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }
}
