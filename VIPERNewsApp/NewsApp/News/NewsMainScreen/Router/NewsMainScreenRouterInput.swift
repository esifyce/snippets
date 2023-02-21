//
//  NewsMainScreenRouterInput.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsMainScreenRouterInput: AnyObject {
    func goToDetail(article: Article)
}
