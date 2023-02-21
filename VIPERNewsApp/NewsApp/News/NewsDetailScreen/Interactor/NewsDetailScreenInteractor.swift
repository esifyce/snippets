//
//  NewsDetailScreenInteractor.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

final class NewsDetailScreenInteractor {
    var newsService: NewsServiceProtocol?
}

// MARK: - NewsDetailScreenInteractorInput
extension NewsDetailScreenInteractor: NewsDetailScreenInteractorInput {}
