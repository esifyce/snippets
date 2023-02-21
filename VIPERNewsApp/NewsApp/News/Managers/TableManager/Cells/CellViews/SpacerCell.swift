//
//  SpacerCell.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol SpacerCellProtocol {
    func cellConfiguration(model: CellTypeProtocol)
}

final class SpacerCell: UITableViewCell {}

// MARK: - SpacerCellProtocol
extension SpacerCell: SpacerCellProtocol {
    func cellConfiguration(model: CellTypeProtocol) {
        self.backgroundColor = model.general.cellBackgroundColor
    }
 }
