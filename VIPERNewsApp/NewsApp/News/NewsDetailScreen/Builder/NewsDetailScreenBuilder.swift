//
//  NewsDetailScreenBuilder.swift
//  NewsApp
//
//  Created by Krasivo on 05.02.2023.
//

import UIKit

final class NewsDetailScreenBuilder: BaseBuilder {
    
}

extension NewsDetailScreenBuilder: NewsDetailScreenBuilderInput {
    func buildScreenPresent(article: Article, tapLink: ((_ url: String) -> Void)?) -> [CellType] {
        tableView.isScrollEnabled = false
        
        let cellModel: [CellType] = [
            .newsDetailCell(general: CellGeneralProperties(cellHeight: UIScreen.main.bounds.height),
                            image: CellImageProperties(image: article.urlToImage ?? ""),
                            label: CellLabelProperties(title: article.title),
                            sublabel: CellLabelProperties(title: article.description ?? ""),
                            datePublish: CellLabelProperties(title: getCurrent(date: article.publishedAt)),
                            sourcePublsh: CellLabelProperties(title: article.source.name),
                            deepLink: CellLabelProperties(title: article.url, titleColor: .systemBlue, tapAction: tapLink))
                ]
        return cellModel
    }
}


fileprivate extension NewsDetailScreenBuilder {
    func getCurrent(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let currentDate = dateFormatter.date(from: date) else { return "none" }
        return "\(currentDate)"
    }
}
