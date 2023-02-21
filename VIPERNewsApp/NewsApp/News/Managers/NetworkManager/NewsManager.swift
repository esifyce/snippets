//
//  NewsManager.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsServiceProtocol {
    func getNews(page: Int, completion: @escaping (Result<NewsModel, Error>) -> Void)
    func getRussianNews(completion: @escaping (Result<NewsModel, Error>) -> Void)
}


class NewsService {
    let router: Router<NewsApi>

    init() {
        let newsURL = URL(string: "https://newsapi.org/")
        self.router = Router(baseURL: newsURL!)
    }
}

extension NewsService: NewsServiceProtocol {
    func getNews(page: Int, completion: @escaping (Result<NewsModel, Error>) -> Void) {
        router.request(.getNews(page: page), completion: { data, response, error in
            
            if error != nil {
                completion(.failure(error!))
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.handleNetworkResponse() {
                    case .success:
                        guard let responseData = data else {
                            completion(.failure(NetworkResponse.noData))
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(NewsModel.self, from: responseData)
                            completion(.success(apiResponse))
                        } catch {
                            completion(.failure(NetworkResponse.unableToDecode))
                        }
                        
                    case .failure(let failureError):
                        completion(.failure(failureError))
                }
            }
        })
    }
    
    func getRussianNews(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        router.request(.getRussianNews, completion: { data, response, error in
            
            if error != nil {
                completion(.failure(error!))
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.handleNetworkResponse() {
                    case .success:
                        guard let responseData = data else {
                            completion(.failure(NetworkResponse.noData))
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(NewsModel.self, from: responseData)
                            completion(.success(apiResponse))
                        } catch {
                            completion(.failure(NetworkResponse.unableToDecode))
                        }
                        
                    case .failure(let failureError):
                        completion(.failure(failureError))
                }
            }
        })
    }
}
