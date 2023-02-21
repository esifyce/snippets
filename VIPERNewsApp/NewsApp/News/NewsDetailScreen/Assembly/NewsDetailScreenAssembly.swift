//
//  NewsDetailScreenAssembly.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsDetailScreenAssembly {
    static func assemble(article: Article) -> UIViewController {
        
        let tableManager = TableManager()
        let viewController = NewsDetailScreenViewController()
        let presenter = NewsDetailScreenPresenter()
        let interactor = NewsDetailScreenInteractor()
        let screenBuilder = NewsDetailScreenBuilder(view: viewController, tableView: viewController.tableView)
        let router = NewsDetailScreenRouter()
        let networkReachabilityManager = NetworkReachabilityManager()

       let newsService = NewsService()
        
        tableManager.setupTableView(tableView: viewController.tableView)
        
        viewController.presenter = presenter
        
        router.view = viewController
        
        presenter.networkReachabilityManager = networkReachabilityManager
        presenter.tableManager = tableManager
        presenter.screenBuilder = screenBuilder
        presenter.router = router
        presenter.interactor = interactor
        presenter.article = article
        presenter.view = viewController
        
        interactor.newsService = newsService

        return viewController
    }
}
