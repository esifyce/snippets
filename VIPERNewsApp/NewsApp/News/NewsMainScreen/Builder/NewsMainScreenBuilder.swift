//
//  NewsMainScreenBuilder.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsMainScreenBuilder: BaseBuilder {
    var resultModel: [NewsModel]?
}

// MARK: - NewsMainScreenBuilderProtocol
extension NewsMainScreenBuilder: NewsMainScreenBuilderInput {
    func buildNewsScreenWhenNotFound() -> [CellType] {
        tableView.isScrollEnabled = false
        
        let topCellModel: [CellType] = [
            .spacerCell(
                general: CellGeneralProperties(
                    cellHeight: (UIScreen.main.bounds.height - 120) / 2 - 30,
                    cellBackgroundColor: .clear))
        ]
        
        let bottomCellModel: [CellType] = [
            .spacerCell(
                general: CellGeneralProperties(
                    cellHeight:  (UIScreen.main.bounds.height - 120) / 2 + 30,
                    cellBackgroundColor: .clear))
        ]
        
        let middleCellModel: [CellType] = [
            .labelCell(general: CellGeneralProperties(
                            cellHeight: 30,
                            cellBackgroundColor: .clear),
                       label: CellLabelProperties(
                        title: "Новости закончились!",
                        titleColor: .black,
                        titleFont: .systemFont(ofSize: 17,weight: .semibold),
                        numberOfLines: 0,
                        textAlignment: .center,
                        leadingConstraint: 16,
                        trailingConstraint: -16),
                       separator: CellSeparatorProperties(isHidden: true))
                ]
        
        let cellModel = topCellModel + middleCellModel + bottomCellModel
        return cellModel
    }
    
    func buildNewsScreenWithResult(allNews: [NewsModel], transitionToNewsDetail: @escaping (Article) -> Void) -> [CellType] {
        tableView.isScrollEnabled = true
        var topCellModel: [CellType] = []
        allNews.forEach { news in
            news.articles.forEach { article in
                topCellModel.append(.newsMainCell(general: CellGeneralProperties(cellHeight: 80, tapAction: {
                    transitionToNewsDetail(article)
                }),
                                                  image: CellImageProperties(image: article.urlToImage ?? ""),
                                                  label: CellLabelProperties(title: article.title),
                                                  sublabel: CellLabelProperties(title: "\(NewsDefaults.obtainEye(title: article.title))"),
                                                  separator: CellSeparatorProperties(isHidden: false)))
            }
        }

        return topCellModel
    }
}
