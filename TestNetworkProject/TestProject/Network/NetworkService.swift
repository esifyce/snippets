//
//  NetworkService.swift
//  MedTech
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private var urlSession: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        urlSession = session
    }
    
    func sendRequest<T: Codable>(
        urlRequest: URLRequest,
        successModel: T.Type,
        completion: @escaping (ProResult<T>) -> Void
    ) {
        let queue = DispatchQueue.main
        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else {
                debugPrint(#function, "Your View Class is dead!")
                return
            }
            if let error = self.validateResponse(data: data, response: response, error: error) {
                if case NetworkErrors.badRequest = error,
                   let model = self.transformFromJSON(data: data, objectType: FailureModel.self) {
                    queue.async {
                        completion(.badRequest(model))
                    }
                } else if case NetworkErrors.unauthorized = error {
                    queue.async {
                    completion(.unauthorized("Токен умер("))
                    }
                } else if case NetworkErrors.internalServerError = error {
                    queue.async {
                        completion(.unauthorized("Не реализовано"))
                    }
                } else {
                    queue.async {
                        completion(.failure("Упс, что-то пошло не так)"))
                    }
                }
            } else if let successModel = self.transformFromJSON(data: data, objectType: T.self) {
                queue.async {
                    completion(.success(successModel))
                }
            } else {
                debugPrint(#function, "Some supernatural things happened")
            }
        }.resume()
    }
    
    private func validateResponse(data: Data?, response: URLResponse?, error: Error?) -> Error? {
        if let err = error {
            return err
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            return URLError(.badServerResponse)
        }
        print(httpResponse.statusCode)
        switch httpResponse.statusCode {
        case 200...210:
            return nil
        case 405:
            return NetworkErrors.forbidden
        case StatusCode.badRequest.code:
            return NetworkErrors.badRequest // 400
        case StatusCode.unauthorized.code:
            return NetworkErrors.unauthorized // 401
        case StatusCode.internalServerError.code:
            return NetworkErrors.internalServerError // 500
        case StatusCode.notImplemented.code:
            return NetworkErrors.notImplemented // 501
        
        default:
            return nil
        }
    }
    
    private func transformFromJSON<T: Codable>(data: Data?, objectType: T.Type) -> T? {
        guard let data = data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
