//
//  HTTPTask.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import UIKit

// HTTPHeaders это просто typealias для словаря
public typealias HTTPHeaders = [String: String]

// HTTPTask отвечает за конфигурацию параметров определенного запроса.

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     additionHeaders: HTTPHeaders)
}
