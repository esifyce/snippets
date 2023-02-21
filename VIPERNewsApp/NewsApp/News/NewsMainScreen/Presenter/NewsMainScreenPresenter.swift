//
//  NewsMainScreenPresenter.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

final class NewsMainScreenPresenter {
    var screenBuilder: NewsMainScreenBuilderInput?
    weak var view: NewsMainScreenViewControllerInput?
    var router: NewsMainScreenRouterInput?
    var tableManager: TableManagerProtocol?
    var interactor: NewsMainScreenInteractorInput?
    var networkReachabilityManager: NetworkReachabilityManagerProtocol?
    
    var startIndicator: () -> Void = {}
    var stopIndicator: () -> Void = {}
    var page = 1
    
    fileprivate var allNews: [NewsModel] = []

}

// MARK: - NewsMainScreenPresenterInput
extension NewsMainScreenPresenter: NewsMainScreenPresenterInput {
    func viewDidLoad() {
        presentEmptyNewsScreen()
        getNews(page: self.page)
    }
    
    func viewWillAppear() {
        guard
            checkConnection(methodHandler: { [weak self] in self?.viewWillAppear() }),
            !allNews.isEmpty
        else { return }
        self.presentNewsScreen(news: self.allNews)
    }
    
    func refreshData() {
        getRussianNews()
    }
}

// MARK: - NewsMainScreenPresenter
fileprivate extension NewsMainScreenPresenter {
    func presentEmptyNewsScreen() {
        guard let newsEmptyCellModel = self.screenBuilder?.buildNewsScreenWhenNotFound() else { return }
        self.tableManager?.fillViewModels(viewModels: newsEmptyCellModel)
    }
    
    func presentNewsScreen(news: [NewsModel]) {
        guard let newsCellModel = self.screenBuilder?.buildNewsScreenWithResult(allNews: news, transitionToNewsDetail: { article in
            self.goToNewsDetail(article: article)
        }) else { return }
        self.tableManager?.fillViewModels(viewModels: newsCellModel)
    }
    
    func getNews(page: Int) {
        guard checkConnection(methodHandler: { [weak self] in self?.getNews(page: page) }) else { return }
        interactor?.getNews(page: page, completion: { [weak self] result in
            guard let self else { return }
            switch result {
                case .success(let news):
                self.allNews.append(news)
                DispatchQueue.main.async {
                    self.presentNewsScreen(news: self.allNews)
                }
                case .failure(let error):
                    print("DEBUG: \(error)")
            }
        })
    }
    
    func getRussianNews() {
        guard checkConnection(methodHandler: { [weak self] in self?.getRussianNews() }) else { return }
        interactor?.getRussianNews(completion: { [weak self] result in
            guard let self else { return }
            switch result {
                case .success(let news):
                self.allNews = [news]
                DispatchQueue.main.async {
                    self.presentNewsScreen(news: self.allNews)
                }
                case .failure(let error):
                    print("DEBUG: \(error)")
            }
        })
    }
    
    func loadNextPage() {
        guard checkConnection(methodHandler: { [weak self] in self?.loadNextPage() }) else { return }
        self.page += 1
        getNews(page: self.page)
    }
    
    func goToNewsDetail(article: Article) {
        guard checkConnection(methodHandler: { [weak self] in self?.goToNewsDetail(article: article) }) else { return }
        self.router?.goToDetail(article: article)
        let countEye = NewsDefaults.obtainEye(title: article.title)
        NewsDefaults.setupEye(eye: countEye + 1, title: article.title)
    }
    
    func checkConnection(methodHandler: (() -> Void)?) -> Bool {
        guard
            let networkReachabilityManager,
            networkReachabilityManager.sessionEndedWithError() else { return true }
        self.view?.showAlert()
        return false
    }
}

extension NewsMainScreenPresenter: TableManagerDelegate {
    func loadNextTablePage() {
        self.loadNextPage()
    }
}
