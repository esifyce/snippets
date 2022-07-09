//
//  PostRouter.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

enum PostRouter: BaseRouter  {
    
    case login(data: Data)
    
    var path: String {
        switch self {
            case .login:
                return "/patient/login/"
        }
    }
    
    var method: HttpMethod {
        switch self {
            case .login:
                return .POST
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
            case  .login:
                return  nil
        }
    }
    
    var httpBody: Data? {
        switch self {
            case let .login(data):
                return data
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
            case .login:
                return nil
        }
    }
}
