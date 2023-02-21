//
//  NewsMainScreenRouter.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsMainScreenRouter {
    weak var view: UIViewController?
}

// MARK: - NewsMainScreenRouterInput
extension NewsMainScreenRouter: NewsMainScreenRouterInput {
    func goToDetail(article: Article) {
        let viewController = NewsDetailScreenAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
