//
//  NewsMainScreenInteractorInput.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsMainScreenInteractorInput: AnyObject {
    func getNews(page: Int, completion: @escaping (Result<NewsModel, Error>) -> Void)
    func getRussianNews(completion: @escaping (Result<NewsModel, Error>) -> Void)
}
