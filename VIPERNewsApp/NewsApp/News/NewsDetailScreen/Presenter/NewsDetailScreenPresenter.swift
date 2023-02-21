//
//  NewsDetailScreenPresenter.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//


final class NewsDetailScreenPresenter {
    var screenBuilder: NewsDetailScreenBuilderInput?
    weak var view: NewsDetailScreenViewController?
    var router: NewsDetailScreenRouterInput?
    var tableManager: TableManagerProtocol?
    var interactor: NewsDetailScreenInteractorInput?
    var networkReachabilityManager: NetworkReachabilityManagerProtocol?
    
    var startIndicator: () -> Void = {}
    var stopIndicator: () -> Void = {}
    var article: Article?

}

// MARK: - NewsDetailScreenPresenterInput
extension NewsDetailScreenPresenter: NewsDetailScreenPresenterInput {
    func viewDidLoad() {
        presentDetailScreen()
    }
    
    func checkConnection(methodHandler: (() -> Void)?) -> Bool {
        guard
            let networkReachabilityManager,
            networkReachabilityManager.sessionEndedWithError() else { return true }
        self.view?.showAlert()
        return false
    }
}

// MARK: - NewsDetailScreenPresenter
fileprivate extension NewsDetailScreenPresenter {
    func presentDetailScreen() {
        guard
            checkConnection(methodHandler: { [weak self] in self?.presentDetailScreen() }),
            let article = self.article,
            let articleCellModel = self.screenBuilder?.buildScreenPresent(article: article, tapLink: { [weak self] url in
                guard let self else { return }
                self.router?.goLink(url: url)
            }) else { return }
        self.tableManager?.fillViewModels(viewModels: articleCellModel)
    }
}
