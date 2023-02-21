//
//  NewsModel.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: CodingKey {
        case status
        case totalResults
        case articles
    }
    
    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.totalResults, forKey: .totalResults)
        try container.encode(self.articles, forKey: .articles)
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    enum CodingKeys: CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
    

    init(source: Source, author: String?, title: String, description: String?, url: String, urlToImage: String?, publishedAt: String, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(Source.self, forKey: .source)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.source, forKey: .source)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encode(self.title, forKey: .title)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.urlToImage, forKey: .urlToImage)
        try container.encode(self.publishedAt, forKey: .publishedAt)
        try container.encodeIfPresent(self.content, forKey: .content)
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
