//
//  NewsDetailScreenBuilderInput.swift
//  NewsApp
//
//  Created by Krasivo on 05.02.2023.
//

import Foundation

protocol NewsDetailScreenBuilderInput: AnyObject {
    func buildScreenPresent(article: Article, tapLink: ((_ url: String) -> Void)?) -> [CellType]
}
