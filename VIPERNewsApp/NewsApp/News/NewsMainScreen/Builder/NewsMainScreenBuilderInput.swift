//
//  NewsMainScreenBuilderProtocol.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsMainScreenBuilderInput: AnyObject {
    func buildNewsScreenWhenNotFound() -> [CellType]
    func buildNewsScreenWithResult(allNews: [NewsModel], transitionToNewsDetail: @escaping (Article) -> Void) -> [CellType]
}
