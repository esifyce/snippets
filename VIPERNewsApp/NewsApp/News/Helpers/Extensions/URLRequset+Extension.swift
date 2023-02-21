//
//  URLRequset+Extension.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

extension URLRequest {
    var curlString: String {
        guard let url = url else { return "" }
        var baseCommand = #"curl "\#(url.absoluteString)""#
        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        var command = [baseCommand]
        if let method = httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }
        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }
        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }
        return command.joined(separator: " \\\n\t")
    }
}

enum NetResult<Error> {
    case success
    case failure(Error)
}

enum NetworkResponse: String, Error {
    case success
    case authenticationError = "Ошибка авторизации"
    case badRequest = "Плохой запрос"
    case outdated = "Ссылка устарела"
    case failed = "Ошибка"
    case noData = "Нет данных"
    case unableToDecode = "Невозможно декодировать"
}

extension HTTPURLResponse {
    func handleNetworkResponse() -> NetResult<Error> {
        switch self.statusCode {
        case 200...299 : return .success
        case 401...500 : return .failure(NetworkResponse.authenticationError)
        case 501...599 : return .failure(NetworkResponse.badRequest)
        case 600 : return .failure(NetworkResponse.outdated)
        default: return .failure(NetworkResponse.failed)
        }
    }
}

extension EndPointType {
    func toParams<T: Encodable>(data : T) -> [String: Any] {
        let param = (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(data))) as? [String: Any] ?? [:]
        return param
    }
}
