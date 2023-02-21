//
//  Encoding.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

typealias BodyParameters = [String : Any]
typealias URLParameters = [String : Any]
typealias Fields = [String : String]
typealias HTTPHeader = [String : String]

protocol ParameterUrlEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: URLParameters) throws
}

protocol ParameterBodyEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: BodyParameters) throws
}

protocol FieldsEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: Fields?)
}

protocol EndPointType {
    var path : String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParameters: BodyParameters? { get }
    var urlParameters: URLParameters? { get }
    var fields: Fields? { get }
    var httpTask: HTTPTask { get }
    var httpHeaders: HTTPHeader? { get }
}

enum HTTPTask {
    case request
}

enum NetworkError: String, Error {
    case parametersNil = "Нет параметров бро"
    case encodingFailed = "Чет не за нилил кодирование оборвалось"
    case missingUrl = "А где URL? Чувак????"
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case path = "PATH"
    case delete = "DELETE"
    case post = "POST"
    case options = "OPTIONS"
    case head = "HEAD"
    case connect = "CONNECT"
    case trace = "TRACE"
    case patch = "PATCH"
}

struct FieldsEncoder: FieldsEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: Fields?) {
        guard let fields = parameters else {return}
        for field in fields {
            if urlRequest.value(forHTTPHeaderField: field.key) == nil {
                urlRequest.setValue(field.value, forHTTPHeaderField: field.key)
            }
        }
    }
}

struct BodyParameterEncoder: ParameterBodyEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: BodyParameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: [ .fragmentsAllowed])
            urlRequest.httpBody = jsonAsData
        } catch  {
            throw NetworkError.encodingFailed
        }
    }
}

struct URLParameterEncoder: ParameterUrlEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: URLParameters) throws {
        
        guard let url = urlRequest.url else {throw NetworkError.missingUrl}
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
    }
}
