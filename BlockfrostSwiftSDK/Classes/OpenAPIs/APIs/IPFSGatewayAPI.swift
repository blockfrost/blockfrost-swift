//
// IPFSGatewayAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class IPFSGatewayAPI: BaseService {
    /**
     Relay to an IPFS gateway

     - parameter iPFSPath: (path)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func callGet(
        iPFSPath: String,
        apiResponseQueue: DispatchQueue? = nil,
        completion: @escaping (_ result: Swift.Result<Void, Error>) -> Void
    ) -> APIRequest {
        callGetWithRequestBuilder(iPFSPath: iPFSPath)
            .execute(apiResponseQueue ?? config.apiResponseQueue) { result -> Void in
                switch result {
                case .success:
                    completion(.success(()))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }

    /**
     Relay to an IPFS gateway
     - GET /ipfs/gateway/{IPFS_path}
     - Retrieve an object from the IFPS gateway (useful if you do not want to rely on a public gateway, such as `ipfs.blockfrost.dev`).
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - parameter iPFSPath: (path)
     - returns: RequestBuilder<Void>
     */
    open func callGetWithRequestBuilder(iPFSPath: String) -> RequestBuilder<Void> {
        var localVariablePath = "/ipfs/gateway/{IPFS_path}"
        let iPFSPathPreEscape = "\(APIHelper.mapValueToPathItem(iPFSPath))"
        let iPFSPathPostEscape = iPFSPathPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{IPFS_path}", with: iPFSPathPostEscape, options: .literal, range: nil)
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = config.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}