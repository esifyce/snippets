//
//  EndPointType.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import UIKit

// В этом протоколе будет находиться вся необходимая информация для конфигурации запроса.
// По сути это URLRequest со всеми сопутствующими компонентами, такими как заголовки, параметры запроса, тело запроса.

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
