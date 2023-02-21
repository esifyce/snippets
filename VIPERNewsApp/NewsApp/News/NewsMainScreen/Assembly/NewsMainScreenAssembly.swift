//
//  NewsMainScreenAssembly.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsMainScreenAssembly {
    static func assemble() -> UIViewController {
        
        let tableManager = TableManager()
        let viewController = NewsMainScreenViewController()
        let presenter = NewsMainScreenPresenter()
        let interactor = NewsMainScreenInteractor()
        let screenBuilder = NewsMainScreenBuilder(view: viewController, tableView: viewController.tableView)
        let router = NewsMainScreenRouter()
        let networkReachabilityManager = NetworkReachabilityManager()
        
       let newsService = NewsService()
        
        tableManager.setupTableView(tableView: viewController.tableView, delegate: presenter)
        
        viewController.presenter = presenter
        
        router.view = viewController
        
        presenter.networkReachabilityManager = networkReachabilityManager
        presenter.tableManager = tableManager
        presenter.screenBuilder = screenBuilder
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        
        interactor.newsService = newsService

        return viewController
    }
}
