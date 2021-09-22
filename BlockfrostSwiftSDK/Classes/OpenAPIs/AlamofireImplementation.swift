// AlamofireImplementations.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire

class AlamofireRequestBuilderFactory: RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        return AlamofireRequestBuilder<T>.self
    }

    func getBuilder<T:Decodable>() -> RequestBuilder<T>.Type {
        return AlamofireDecodableRequestBuilder<T>.self
    }
}

// Store manager to retain its reference
private var managerStore = SynchronizedDictionary<String, Alamofire.Session>()

public class AlamoURLEncoding: URLEncoding, Alamofire.ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        return try self._encode(try urlRequest.asURLRequest(), with: parameters)
    }
}

public class AlamoFormDataEncoding: FormDataEncoding, Alamofire.ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        return try self._encode(try urlRequest.asURLRequest(), with: parameters)
    }
}


public class AlamoFormURLEncoding: FormURLEncoding, Alamofire.ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        return try self._encode(try urlRequest.asURLRequest(), with: parameters)
    }
}

public class AlamoJSONDataEncoding: JSONDataEncoding, Alamofire.ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        return self._encode(try urlRequest.asURLRequest(), with: parameters)
    }
}

open class APIAlamoRequest : APIRequest {
    public var request: Alamofire.Request? = nil
    public var session: Alamofire.Session? = nil

    public init(request: Request?, session: Session?) {
        self.request = request
        self.session = session
        super.init()
    }

    override open func cancel() -> Bool {
        guard let req = request else { return false }
        req.cancel()
        return true
    }
}

open class AlamofireRequestBuilder<T>: RequestBuilder<T> {
    required public init(method: String, URLString: String, parameters: [String: Any]?, headers: [String: String] = [:], data: Data? = nil, config: BlockfrostConfig? = nil) {
        super.init(method: method, URLString: URLString, parameters: parameters, headers: headers, data: data, config: config)
    }
    
    /**
     May be overridden by a subclass if you want to control the session
     configuration.
     API queue has to be a serial queue for Alamofire root queue
     */
    open func createSessionManager(rootQueue: DispatchQueue? = nil) -> Alamofire.Session {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = buildHeaders()
        let queue = rootQueue ?? DispatchQueue(label: "org.alamofire.session.rootQueue")
        return Alamofire.Session(configuration: configuration, rootQueue: queue, interceptor: config.retryPolicy)
    }

    /**
     May be overridden by a subclass if you want to custom request constructor.
     */
    open func createURLRequest(method: HTTPMethod, encoding: ParameterEncoding, headers: [String: String]) throws -> URLRequest? {
        guard let url = URL(string: URLString) else {
            throw AlamoDownloadException.requestMissingURL
        }
        var originalRequest = URLRequest(url: url)

        originalRequest.httpMethod = method.rawValue

        headers.forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        buildHeaders().forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let pid = config.projectId {
            originalRequest.setValue(pid, forHTTPHeaderField: "project_id")
        }

        let modifiedRequest = try encoding.encode(originalRequest, with: parameters)
        return modifiedRequest
    }

    /**
     May be overridden by a subclass if you want to control the Content-Type
     that is given to an uploaded form part.

     Return nil to use the default behavior (inferring the Content-Type from
     the file extension).  Return the desired Content-Type otherwise.
     */
    open func contentTypeForFormPart(fileURL: URL) -> String? {
        return nil
    }

    /**
     May be overridden by a subclass if you want to control the request
     configuration (e.g. to override the cache policy).
     */
    open func makeRequest(manager: Session, method: HTTPMethod, encoding: Alamofire.ParameterEncoding, headers: [String:String]?) -> DataRequest {
        return manager.request(URLString, method: Alamofire.HTTPMethod(rawValue: method.rawValue),
                               parameters: parameters, encoding: encoding, headers: headers != nil ? HTTPHeaders.init(headers!) : nil)
    }

    override open func execute(_ apiResponseQueue: DispatchQueue? = nil,
                               _ completion: @escaping (_ result: Swift.Result<Response<T>, Error>) -> Void) -> APIAlamoRequest {
        let managerId: String = UUID().uuidString
        // Create a new manager for each request to customize its request header
        //let apiQueue = apiResponseQueue ?? config.apiResponseQueue
        let manager = createSessionManager(rootQueue: nil)
        managerStore[managerId] = manager

        guard let xMethod = HTTPMethod(rawValue: method) else {
            fatalError("Unsupported Http method - \(method)")
        }

        let encoding: Alamofire.ParameterEncoding

        switch xMethod {
        case .get, .head:
            encoding = AlamoURLEncoding()

        case .options, .post, .put, .patch, .delete, .trace, .connect:
            let contentType = headers["Content-Type"] ?? "application/json"

            if contentType == "application/json" {
                encoding = AlamoJSONDataEncoding()
            } else if contentType == "multipart/form-data" {
                encoding = AlamoFormDataEncoding(contentTypeForFormPart: contentTypeForFormPart(fileURL:))
            } else if contentType == "application/x-www-form-urlencoded" {
                encoding = AlamoFormURLEncoding()
            } else if contentType == "application/cbor" {
                encoding = AlamoURLEncoding()
            } else {
                fatalError("Unsupported Media Type - \(contentType)")
            }
        }

        let fileKeys = parameters == nil ? [] : parameters!.filter { $1 is NSURL }
                                                           .map { $0.0 }

        if let binaryData = data {
            let request = manager.upload(binaryData, to: URLString, method: Alamofire.HTTPMethod(rawValue: xMethod.rawValue), headers: nil)
            request.uploadProgress(queue: .main) { progress in
                if let onProgressReady = self.onProgressReady {
                    onProgressReady(progress)
                }
            }
            processRequest(request: request, managerId, apiResponseQueue, completion)
            return APIAlamoRequest(request: request, session: manager)

        } else if fileKeys.count > 0 {
            let request = manager.upload(multipartFormData: { mpForm in
                for (k, v) in self.parameters! {
                    switch v {
                    case let fileURL as URL:
                        if let mimeType = self.contentTypeForFormPart(fileURL: fileURL) {
                            mpForm.append(fileURL, withName: k, fileName: fileURL.lastPathComponent, mimeType: mimeType)
                        }
                        else {
                            mpForm.append(fileURL, withName: k)
                        }
                    case let string as String:
                        mpForm.append(string.data(using: String.Encoding.utf8)!, withName: k)
                    case let number as NSNumber:
                        mpForm.append(number.stringValue.data(using: String.Encoding.utf8)!, withName: k)
                    default:
                        fatalError("Unprocessable value \(v) with key \(k)")
                    }
                }
            }, to: URLString, method: Alamofire.HTTPMethod(rawValue: xMethod.rawValue), headers: nil)
            request.uploadProgress(queue: .main) { progress in
                if let onProgressReady = self.onProgressReady {
                    onProgressReady(progress)
                }
            }
            processRequest(request: request, managerId, apiResponseQueue, completion)
            return APIAlamoRequest(request: request, session: manager)
        } else {
            let request = makeRequest(manager: manager, method: xMethod, encoding: encoding, headers: nil)
            if let onProgressReady = self.onProgressReady {
                onProgressReady(request.downloadProgress)
            }
            processRequest(request: request, managerId, apiResponseQueue, completion)
            return APIAlamoRequest(request: request, session: manager)
        }
    }

    fileprivate func getErrorStr(_ data: Data?) -> String? {
        guard let dt = data else {
            return nil
        }
        return String(data: dt, encoding: .utf8)
    }

    fileprivate func buildError<R>(_ response: DataResponse<R, AFError>, error: Error) -> Error {
        if let dt = response.data {
            let decoded = CodableHelper.decode(Status.self, from: dt)
            switch(decoded){
            case .failure(_): break
            case .success(let res):
                return ErrorResponse.errorStatus(response.response?.statusCode ?? 500, res, response.response, error)
            }
        }

        return ErrorResponse.error(response.response?.statusCode ?? 500, response.data, response.response, error)
    }

    fileprivate func processRequest(request: DataRequest, _ managerId: String, _ apiResponseQueue: DispatchQueue? = nil, _ completion: @escaping (_ response: Swift.Result<Response<T>, Error>) -> Void) {
        if let credential = self.credential {
            request.authenticate(with: credential)
        }

        let cleanupRequest = {
            managerStore[managerId] = nil
        }

        let validatedRequest = request.validate()

        switch T.self {
        case is String.Type:
            validatedRequest.responseString(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (stringResponse) in
                cleanupRequest()

                switch(stringResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(self.buildError(stringResponse, error: err)))
                    return
                    
                case .success(let r):
                    completion(Swift.Result.success(
                        Response(
                            response: stringResponse.response!,
                            body: (r as! T)
                        )
                    ))
                }
                
            })
        case is URL.Type:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (dataResponse) in
                cleanupRequest()

                do {
                    
                    switch(dataResponse.result){
                    case .failure(let err):
                        completion(Swift.Result.failure(self.buildError(dataResponse, error: err)))
                        return
                        
                    case .success(let data):
                        guard let request = request.request else {
                            throw AlamoDownloadException.requestMissing
                        }

                        let fileManager = FileManager.default
                        let urlRequest = try request.asURLRequest()
                        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                        let requestURL = try self.getURL(from: urlRequest)

                        var requestPath = try self.getPath(from: requestURL)

                        if let headerFileName = self.getFileName(fromContentDisposition: dataResponse.response?.allHeaderFields["Content-Disposition"] as? String) {
                            requestPath = requestPath.appending("/\(headerFileName)")
                        }

                        let filePath = documentsDirectory.appendingPathComponent(requestPath)
                        let directoryPath = filePath.deletingLastPathComponent().path

                        try fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
                        try data.write(to: filePath, options: .atomic)

                        completion(Swift.Result.success(
                            Response(
                                response: dataResponse.response!,
                                body: (filePath as! T)
                            )
                        ))
                    }

                } catch let requestParserError as AlamoDownloadException {
                    completion(Swift.Result.failure(ErrorResponse.error(400, dataResponse.data, dataResponse.response, requestParserError)))
                } catch let error {
                    completion(Swift.Result.failure(ErrorResponse.error(400, dataResponse.data, dataResponse.response, error)))
                }
                return
            })
        case is Void.Type:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (voidResponse) in
                cleanupRequest()

                switch(voidResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(voidResponse, error: err)
                    ))
                    return
                    
                case .success:
                    completion(Swift.Result.success(
                        Response(
                            response: voidResponse.response!,
                            body: nil)
                    ))
                }
            })
        default:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (dataResponse) in
                cleanupRequest()
                
                switch(dataResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(dataResponse, error: err)
                    ))
                    return
                    
                case .success(let r):
                    completion(Swift.Result.success(
                        Response(
                            response: dataResponse.response!,
                            body: (r as! T)
                        ))
                    )
                }
            })
        }
    }

    open func buildHeaders() -> [String: String] {
        var httpHeaders = HTTPHeaders.default.dictionary
        for (key, value) in headers {
            httpHeaders[key] = value
        }
        if let pid = config.projectId {
            httpHeaders["project_id"] = pid
        }
        for (key, value) in config.customHeaders {
            httpHeaders[key] = value
        }
        return httpHeaders
    }

    fileprivate func getFileName(fromContentDisposition contentDisposition : String?) -> String? {

        guard let contentDisposition = contentDisposition else {
            return nil
        }

        let items = contentDisposition.components(separatedBy: ";")

        var filename : String? = nil

        for contentItem in items {

            let filenameKey = "filename="
            guard let range = contentItem.range(of: filenameKey) else {
                break
            }

            filename = contentItem
            return filename?
                .replacingCharacters(in: range, with:"")
                .replacingOccurrences(of: "\"", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
        }

        return filename

    }

    fileprivate func getPath(from url : URL) throws -> String {

        guard var path = URLComponents(url: url, resolvingAgainstBaseURL: true)?.path else {
            throw AlamoDownloadException.requestMissingPath
        }

        if path.hasPrefix("/") {
            path.remove(at: path.startIndex)
        }

        return path

    }

    fileprivate func getURL(from urlRequest : URLRequest) throws -> URL {

        guard let url = urlRequest.url else {
            throw AlamoDownloadException.requestMissingURL
        }

        return url
    }

}

fileprivate enum AlamoDownloadException : Error {
    case responseDataMissing
    case responseFailed
    case requestMissing
    case requestMissingPath
    case requestMissingURL
}

public enum AlamofireDecodableRequestBuilderError: Error {
    case emptyDataResponse
    case nilHTTPResponse
    case jsonDecoding(DecodingError)
    case generalError(Error)
}

open class AlamofireDecodableRequestBuilder<T:Decodable>: AlamofireRequestBuilder<T> {

    override fileprivate func processRequest(request: DataRequest, _ managerId: String, _ apiResponseQueue: DispatchQueue? = nil, _ completion: @escaping (_ response: Swift.Result<Response<T>, Error>) -> Void) {
        if let credential = self.credential {
            request.authenticate(with: credential)
        }

        let cleanupRequest = {
            managerStore[managerId] = nil
        }

        let validatedRequest = request.validate()

        switch T.self {
        case is String.Type:
            validatedRequest.responseString(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (stringResponse) in
                cleanupRequest()
                
                switch(stringResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(stringResponse, error: err)
                    ))
                    return
                    
                case .success(let r):
                    completion(Swift.Result.success(
                        Response(
                            response: stringResponse.response!,
                            body: (r as! T)
                        ))
                    )
                }
            })
        case is Void.Type:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (voidResponse) in
                cleanupRequest()
                
                switch(voidResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(voidResponse, error: err)
                    ))
                    return
                    
                case .success:
                    completion(Swift.Result.success(
                        Response(
                            response: voidResponse.response!,
                            body: nil))
                    )
                }
            })
        case is Data.Type:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (dataResponse) in
                cleanupRequest()
                
                switch(dataResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(dataResponse, error: err)
                    ))
                    return
                    
                case .success(let r):
                    completion(Swift.Result.success(
                        Response(
                            response: dataResponse.response!,
                            body: r as? T
                        ))
                    )
                }
            })
        default:
            validatedRequest.responseData(queue: apiResponseQueue ?? config.apiResponseQueue, completionHandler: { (dataResponse: AFDataResponse<Data>) in
                cleanupRequest()
                
                switch(dataResponse.result){
                case .failure(let err):
                    completion(Swift.Result.failure(
                            self.buildError(dataResponse, error: err)
                    ))
                    return
                    
                case .success(let r):
                    let data = r
                    guard !data.isEmpty else {
                        completion(Swift.Result.failure(ErrorResponse.error(-1, nil, dataResponse.response, AlamofireDecodableRequestBuilderError.emptyDataResponse)))
                        return
                    }

                    guard let httpResponse = dataResponse.response else {
                        completion(Swift.Result.failure(ErrorResponse.error(-2, nil, dataResponse.response, AlamofireDecodableRequestBuilderError.nilHTTPResponse)))
                        return
                    }
                    
                    let decoded = CodableHelper.decode(T.self, from: data)
                    switch(decoded){
                    case .failure(let err):
                        completion(Swift.Result.failure(err))
                    case .success(let res):
                        completion(Swift.Result.success(Response(response: httpResponse, body: res)))
                        
                    }
                }
            })
        }
    }

}
