//
//  Router.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import Foundation

// Мы объявляем private переменную типа URLSessionTask. На ней и будет лежать вся работа. Мы делаем ее private, потому что не хотим чтобы кто-то извне мог изменить ее.

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    // Запрос создается с помощью вызова функции buildRequest Вызов функции обернут в do-try-catch, потому что функции кодировки внутри buildRequest могут выдавать исключения. В completion передаются response, data и error.
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    // Эта функция отвечает за всю жизненно важную работу в нашем сетевом слое. По сути, конвертирует EndPointType в URLRequest. И как только EndPoint превращается в запрос, мы можем передать его в session.
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        // Мы инициализируем переменную запроса URLRequest. Задаем в ней наш базовый URL-адрес и добавляем к нему путь конкретного запроса, который будет использоваться.
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        //  Присваиваем request.httpMethod http-метод из нашего EndPoint.
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(bodyParameters: let bodyParameters, urlParameters: let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeaders(bodyParameters: let bodyParameters, urlParameters: let urlParameters, additionHeaders: let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    
    // Эта функция отвечает за преобразование наших параметров запроса. Поскольку наш API предполагает использование bodyParameters в виде JSON и URLParameters преобразованными в формат URL, то мы просто передаем соответствующие параметры в соответствующие функции преобразования
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    
    
}
