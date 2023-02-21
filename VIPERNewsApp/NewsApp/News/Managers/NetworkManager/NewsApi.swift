//
//  NewsApi.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

// MARK: - News Api
enum NewsApi {
    case getNews(page: Int) //get
    case getRussianNews
}

extension NewsApi: EndPointType {
    var path: String {
        switch self {
            case .getNews:
                return "v2/everything"
            case .getRussianNews:
                return "v2/top-headlines"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getNews:
                return .get
            case .getRussianNews:
                return .get
        }
    }
    
    var bodyParameters: BodyParameters? {
        switch self {
            case .getNews:
                return nil
            case .getRussianNews:
                return nil
        }
    }
    
    var urlParameters: URLParameters? {
        switch self {
            case .getNews(page: let page):
                return ["q": "news",
                        "pageSize": 20,
                        "page": page,
                        "apiKey": NewsDefaults.obtainToken()]
             case .getRussianNews:
                return [
                    "country": "ru",
                    "apiKey": NewsDefaults.obtainToken()]
        }
    }
    
    var fields: Fields? {
        switch self {
            case .getNews:
                return ["accept":"application/json",
                        "Content-Type":"application/json"]
            case .getRussianNews:
                return ["accept":"application/json",
                        "Content-Type":"application/json"]
        }
    }
    
    var httpTask: HTTPTask {
        switch self {
            case .getNews:
                return .request
            case .getRussianNews:
                return .request
        }
    }
    
    var httpHeaders: HTTPHeader? {
        switch self {
        case .getNews:
            return nil
        case .getRussianNews:
            return nil
        }
    }
}
