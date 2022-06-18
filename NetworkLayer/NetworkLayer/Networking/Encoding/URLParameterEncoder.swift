//
//  URLParameterEncoder.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import Foundation

// Этот код берет список параметров, преобразует и форматирует их для использования в качестве параметров URL. Как вы знаете, некоторые символы запрещено использовать в URL. Параметры также разделяются символом "&", следовательно мы должны позаботиться об этом. Мы также должны задать дефолтное значение заголовкам, если они не установлены в запросе. 

public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8",
                                forHTTPHeaderField: "Content-Type")
        }
    }
    
    
}
