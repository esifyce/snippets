//
//  HTTPMethod.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import UIKit

// Это перечисление будет использоваться для установки HTTP-метода нашего запроса. 

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
