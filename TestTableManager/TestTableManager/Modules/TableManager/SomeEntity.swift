//
//  SomeEntity.swift
//  TestTableManager
//
//  Created by Krasivo on 17.05.2023.
//

import Foundation

struct ServiceSectionModel {
    let titleText: String
    var serviceText: String
}

struct ServiceModel {
    let titleText: String
    var serviceText: String
    var textChanged: ((String) -> Void)?
}



struct SearchResponseModel: Codable {
  // результат поисковой выдачи по продуктам
  let searchProductsResponse: [SearchProductModel]
  // результат поисковой выдачи по секциям каталога
  let searchSectionResponse: [CatalogSectionModel]
}

struct CatalogSectionModel: Codable {
    let sectionId: String
    let sectionName: String
    let sectionIconURL: String?
}

struct SearchProductModel: Codable {
    let productId: String
    let productName: String
    let productIconURL: String?
    
    init(productId: String, productName: String, productIconURL: String?) {
        self.productId = productId
        self.productName = productName
        self.productIconURL = productIconURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try container.decode(String.self, forKey: .productId)
        self.productName = try container.decode(String.self, forKey: .productName)
        self.productIconURL = try container.decodeIfPresent(String.self, forKey: .productIconURL)
    }
    
    enum CodingKeys: CodingKey {
        case productId
        case productName
        case productIconURL
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.productName, forKey: .productName)
        try container.encodeIfPresent(self.productIconURL, forKey: .productIconURL)
    }
}
