//
//  NewsDetailScreenRouter.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit
import WebKit

final class NewsDetailScreenRouter {
    weak var view: UIViewController?
}

// MARK: - NewsMainScreenRouterInput
extension NewsDetailScreenRouter: NewsDetailScreenRouterInput {
    func goLink(url: String) {
        guard let webURL = URL(string: url) else { return }
        let controller = UIViewController()
        let webView = WKWebView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)))
        controller.view.addSubview(webView)
        controller.title = "Open Link"
        let url = webURL
        let request = URLRequest(url: url)
        webView.load(request)
        view?.navigationController?.pushViewController(controller, animated: true)
    }
}
