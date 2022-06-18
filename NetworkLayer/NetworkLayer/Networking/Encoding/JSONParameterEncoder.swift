//
//  JSONParameterEncoder.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import Foundation

// Все аналогично как и в случае с URLParameter, просто здесь мы преобразуем параметры для JSON и опять же добавляем параметры, определяющие кодировку «application/json», в хедер

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters,
                                                        options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
