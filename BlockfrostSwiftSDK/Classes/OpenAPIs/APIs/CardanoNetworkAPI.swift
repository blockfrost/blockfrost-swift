//
// CardanoNetworkAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class CardanoNetworkAPI: BaseService {
    /**
     Network information

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getNetwork(apiResponseQueue: DispatchQueue? = nil, completion: @escaping (_ result: Swift.Result<Network, Error>) -> Void) -> APIRequest {
        getNetworkWithRequestBuilder()
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
     Network information
     - GET /network
     - Return detailed network information.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - returns: RequestBuilder<Network>
     */
    open func getNetworkWithRequestBuilder() -> RequestBuilder<Network> {
        let localVariablePath = "/network"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Network>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}