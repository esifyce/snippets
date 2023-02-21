//
//  BaseRouter.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: AnyObject {
    
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType> : NSObject, NetworkRouter, URLSessionDataDelegate {
    
    var task : URLSessionTask?
    var baseURL: URL
    
    let operationQueue: OperationQueue = OperationQueue()
    
    init(baseURL: URL) {
        self.baseURL = baseURL
        super.init()
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
        do {
            
            let request = try buildRequest(from: route)
            switch request.httpMethod {
            case HTTPMethod.post.rawValue, HTTPMethod.put.rawValue:
                task = session.uploadTask(with: request, from: request.httpBody, completionHandler: { [weak self] data, response, error in
                    self?.didObtainErrorRequest(response: response, request: request)
                    completion(data, response, error)
                })
            default:
                task = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
                    self?.didObtainErrorRequest(response: response, request: request)
                    completion(data, response, error)
                })
            }
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    private func didObtainErrorRequest(response: URLResponse?, request: URLRequest?) {
        guard let responseHttp = response as? HTTPURLResponse else {
            return
        }
        switch responseHttp.statusCode {
        case 400...402, 404...500 :
            print("DEBUG: ERROR CODE = \(responseHttp.statusCode)")
            return
        default: return
        }
    }
    
    func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: self.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 30.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.httpTask {
            case .request:
                try self.configureParameters(bodyParameters: route.bodyParameters, urlParameters: route.urlParameters, request: &request)
                self.configureFields(fields: route.fields, request: &request)
                self.addAdditionalHeaders(route.httpHeaders, request: &request)
            }
            print("CURL \n\(request.curlString)")
            return request
        } catch  {
            throw error
        }
    }
    
    func cancel() {
        task?.cancel()
    }
    
    func configureParameters(bodyParameters: BodyParameters?,
                                    urlParameters: URLParameters?,
                                    request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try BodyParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch  {
            throw error
        }
    }
    
    func configureFields(fields: Fields?, request: inout URLRequest) {
        FieldsEncoder.encode(urlRequest: &request, with: fields)
    }
    
    func addAdditionalHeaders(_ additionalHeaders: HTTPHeader?, request: inout URLRequest) {
        guard let headers = additionalHeaders else {return}
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
    
