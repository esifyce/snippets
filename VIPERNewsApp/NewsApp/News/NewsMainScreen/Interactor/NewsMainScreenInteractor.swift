//
//  NewsMainScreenInteractor.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

final class NewsMainScreenInteractor {
    var newsService: NewsServiceProtocol?

}

// MARK: - NewsMainScreenInteractorInput
extension NewsMainScreenInteractor: NewsMainScreenInteractorInput {
    func getNews(page: Int, completion: @escaping (Result<NewsModel, Error>) -> Void) {
        newsService?.getNews(page: page, completion: completion)
    }
    
    func getRussianNews(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        newsService?.getRussianNews(completion: completion)
    }
}
