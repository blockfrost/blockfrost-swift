//
// MetricsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

open class MetricsAPI: BaseService {
    /**
     Blockfrost usage metrics

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getMetrics(apiResponseQueue: DispatchQueue? = nil, completion: @escaping (_ result: Swift.Result<[Metric], Error>) -> Void) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            getMetricsWithRequestBuilder()
        }
    }

    /**
     Blockfrost usage metrics

     - returns: [Metrics]
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func getMetricsAsync(

    ) async throws -> [Metric] {
        try await asyncWrapper {
            getMetricsWithRequestBuilder()
        }
    }

    /**
     Blockfrost usage metrics
     - GET /metrics/
     - History of your Blockfrost usage metrics in the past 30 days.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - returns: RequestBuilder<[Metric]>
     */
    open func getMetricsWithRequestBuilder() -> RequestBuilder<[Metric]> {
        let localVariablePath = "/metrics/"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Metric]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }

    /**
     Blockfrost endpoint usage metrics

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the result
     */
    open func getMetricsEndpoints(apiResponseQueue: DispatchQueue? = nil, completion: @escaping (_ result: Swift.Result<[MetricsEndpoint], Error>) -> Void) -> APIRequest {
        completionWrapper(apiResponseQueue, completion: completion) {
            getMetricsEndpointsWithRequestBuilder()
        }
    }

    /**
     Blockfrost endpoint usage metrics

     - returns: [MetricsEndpoints]
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    open func getMetricsEndpointsAsync(

    ) async throws -> [MetricsEndpoint] {
        try await asyncWrapper {
            getMetricsEndpointsWithRequestBuilder()
        }
    }

    /**
     Blockfrost endpoint usage metrics
     - GET /metrics/endpoints
     - History of your Blockfrost usage metrics per endpoint in the past 30 days.
     - API Key:
       - type: apiKey project_id
       - name: ApiKeyAuth
     - returns: RequestBuilder<[MetricsEndpoint]>
     */
    open func getMetricsEndpointsWithRequestBuilder() -> RequestBuilder<[MetricsEndpoint]> {
        let localVariablePath = "/metrics/endpoints"
        let localVariableURLString = config.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [:]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[MetricsEndpoint]>.Type = config.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: localVariableUrlComponents?.string ?? localVariableURLString, parameters: localVariableParameters, headers: localVariableHeaderParameters, config: self.config)
    }
}
