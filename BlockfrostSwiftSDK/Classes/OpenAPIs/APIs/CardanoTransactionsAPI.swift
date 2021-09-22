//
// CardanoTransactionsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoTransactionsAPI : BaseService {

    /**
     * enum for parameter contentType
     */
    public enum ContentType_txSubmitPost: String, CaseIterable {
        case applicationCbor = "application/cbor"
    }

    /**
     Specific transaction

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransaction(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<TxContent, Error>) -> Void
    ) -> APIRequest {
        getTransactionWithRequestBuilder(hash: hash)
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
     Specific transaction
     - GET /txs/{hash}
     - Return content of the requested transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<TxContent>
     */
    open func getTransactionWithRequestBuilder(hash: String) -> RequestBuilder<TxContent> {
        var localVariablePath = "/txs/{hash}"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TxContent>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction delegation certificates

     - parameter hash: (path) Hash of the requested transaction.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionDelegations(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentDelegation], Error>) -> Void
    ) -> APIRequest {
        getTransactionDelegationsWithRequestBuilder(hash: hash)
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
     Transaction delegation certificates
     - GET /txs/{hash}/delegations
     - Obtain information about delegation certificates of a specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction.
     - returns: RequestBuilder<[TxContentDelegation]>
     */
    open func getTransactionDelegationsWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentDelegation]> {
        var localVariablePath = "/txs/{hash}/delegations"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentDelegation]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction metadata

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionMetadata(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentMetadata], Error>) -> Void
    ) -> APIRequest {
        getTransactionMetadataWithRequestBuilder(hash: hash)
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
     Transaction metadata
     - GET /txs/{hash}/metadata
     - Obtain the transaction metadata.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<[TxContentMetadata]>
     */
    open func getTransactionMetadataWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentMetadata]> {
        var localVariablePath = "/txs/{hash}/metadata"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentMetadata]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction metadata in CBOR

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionMetadataCbor(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentMetadataCbor], Error>) -> Void
    ) -> APIRequest {
        getTransactionMetadataCborWithRequestBuilder(hash: hash)
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
     Transaction metadata in CBOR
     - GET /txs/{hash}/metadata/cbor
     - Obtain the transaction metadata in CBOR.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<[TxContentMetadataCbor]>
     */
    open func getTransactionMetadataCborWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentMetadataCbor]> {
        var localVariablePath = "/txs/{hash}/metadata/cbor"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentMetadataCbor]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction MIRs

     - parameter hash: (path) Hash of the requested transaction.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionMirs(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentMir], Error>) -> Void
    ) -> APIRequest {
        getTransactionMirsWithRequestBuilder(hash: hash)
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
     Transaction MIRs
     - GET /txs/{hash}/mirs
     - Obtain information about Move Instantaneous Rewards (MIRs) of a specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction.
     - returns: RequestBuilder<[TxContentMir]>
     */
    open func getTransactionMirsWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentMir]> {
        var localVariablePath = "/txs/{hash}/mirs"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentMir]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction stake pool retirement certificates

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionPoolRetires(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentPoolRetir], Error>) -> Void
    ) -> APIRequest {
        getTransactionPoolRetiresWithRequestBuilder(hash: hash)
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
     Transaction stake pool retirement certificates
     - GET /txs/{hash}/pool_retires
     - Obtain information about stake pool retirements within a specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<[TxContentPoolRetir]>
     */
    open func getTransactionPoolRetiresWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentPoolRetir]> {
        var localVariablePath = "/txs/{hash}/pool_retires"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentPoolRetir]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction stake pool registration and update certificates

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionPoolUpdates(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentPoolCert], Error>) -> Void
    ) -> APIRequest {
        getTransactionPoolUpdatesWithRequestBuilder(hash: hash)
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
     Transaction stake pool registration and update certificates
     - GET /txs/{hash}/pool_updates
     - Obtain information about stake pool registration and update certificates of a specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<[TxContentPoolCert]>
     */
    open func getTransactionPoolUpdatesWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentPoolCert]> {
        var localVariablePath = "/txs/{hash}/pool_updates"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentPoolCert]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction redeemers

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionRedeemers(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentRedeemer], Error>) -> Void
    ) -> APIRequest {
        getTransactionRedeemersWithRequestBuilder(hash: hash)
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
     Transaction redeemers
     - GET /txs/{hash}/redeemers
     - Obtain the transaction redeemers.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<[TxContentRedeemer]>
     */
    open func getTransactionRedeemersWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentRedeemer]> {
        var localVariablePath = "/txs/{hash}/redeemers"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentRedeemer]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction stake addresses certificates

     - parameter hash: (path) Hash of the requested transaction.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionStakes(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentStakeAddr], Error>) -> Void
    ) -> APIRequest {
        getTransactionStakesWithRequestBuilder(hash: hash)
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
     Transaction stake addresses certificates
     - GET /txs/{hash}/stakes
     - Obtain information about (de)registration of stake addresses within a transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction.
     - returns: RequestBuilder<[TxContentStakeAddr]>
     */
    open func getTransactionStakesWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentStakeAddr]> {
        var localVariablePath = "/txs/{hash}/stakes"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentStakeAddr]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction UTXOs

     - parameter hash: (path) Hash of the requested transaction
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionUtxos(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<TxContentUtxo, Error>) -> Void
    ) -> APIRequest {
        getTransactionUtxosWithRequestBuilder(hash: hash)
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
     Transaction UTXOs
     - GET /txs/{hash}/utxos
     - Return the inputs and UTXOs of the specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction
     - returns: RequestBuilder<TxContentUtxo>
     */
    open func getTransactionUtxosWithRequestBuilder(hash: String) -> RequestBuilder<TxContentUtxo> {
        var localVariablePath = "/txs/{hash}/utxos"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TxContentUtxo>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Transaction withdrawal

     - parameter hash: (path) Hash of the requested transaction.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getTransactionWithdrawals(
        hash: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<[TxContentWithdrawal], Error>) -> Void
    ) -> APIRequest {
        getTransactionWithdrawalsWithRequestBuilder(hash: hash)
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
     Transaction withdrawal
     - GET /txs/{hash}/withdrawals
     - Obtain information about withdrawals of a specific transaction.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter hash: (path) Hash of the requested transaction.
     - returns: RequestBuilder<[TxContentWithdrawal]>
     */
    open func getTransactionWithdrawalsWithRequestBuilder(hash: String) -> RequestBuilder<[TxContentWithdrawal]> {
        var localVariablePath = "/txs/{hash}/withdrawals"
        let hashPreEscape = "\(APIHelper.mapValueToPathItem(hash))"
        let hashPostEscape = hashPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{hash}", with: hashPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[TxContentWithdrawal]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Submit a transaction

     - parameter contentType: (header)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func submitTransaction(
        transaction: Data,
        contentType: ContentType_txSubmitPost = .applicationCbor,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<String, Error>) -> Void
    ) -> APIRequest {
        submitTransactionWithRequestBuilder(transaction: transaction, contentType: contentType)
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
     Submit a transaction
     - POST /tx/submit
     - Submit an already serialized transaction to the network.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter contentType: (header)
     - returns: RequestBuilder<String>
     */
    open func submitTransactionWithRequestBuilder(transaction: Data, contentType: ContentType_txSubmitPost) -> RequestBuilder<String> {
        let localVariablePath = "/tx/submit"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": contentType.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<String>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: localVariableUrlComponents?.string ?? localVariableURLString,
                parameters: localVariableParameters, headers: localVariableHeaderParameters, data: transaction)
    }
}
