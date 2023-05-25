//
//  HomeTableManager.swift
//  CustomLeftSwipableCard
//
//  Created by Krasivo on 23.05.2023.
//

import UIKit

enum HomeCellType {
    case cardCell
}

protocol HomeConfiguratorProtocol {
    var reuseId: String { get } // переменная для ячейки с reuse id
    var cellType: HomeCellType { get } // тип ячейки для отработки нажатия
    var cellHeight: CGFloat { get set } // высота ячейки
    func setupCell(_ cell: UIView) // настройка ячейки
}

final class CardHomeServiceConfigurator: HomeConfiguratorProtocol {
    var reuseId: String { String(describing: CardHomeTableViewCell.self) }
    var cellType: HomeCellType = .cardCell
    var model: CardHomeViewModel?
    var cellHeight: CGFloat = 212
    
    func setupCell(_ cell: UIView) {
        guard let cell = cell as? CardHomeTableViewCell,
              let sectionModel = model else { return }
        cell.selectionStyle = .none
        cell.configureCell(viewModel: sectionModel)
    }
}

protocol HomeTableManagerDelegate: AnyObject {
    func didCardTap()
}

protocol HomeTableManagerProtocol: AnyObject {
    func injectTable(_ tableView: UITableView, delegate: HomeTableManagerDelegate)
    func displayServiceResult(_ results: [CardHomeViewModel])
}

final class HomeTableManager: NSObject, HomeTableManagerProtocol {
    // MARK: - Private properties
    private var tableView: UITableView?
    private var configuratorsDataSource: [HomeConfiguratorProtocol] = []
    weak var delegate: HomeTableManagerDelegate?
    
    // MARK: - Public functions
    func injectTable(_ tableView: UITableView, delegate: HomeTableManagerDelegate) {
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.delegate = delegate
    }
    
    func displayServiceResult(_ results: [CardHomeViewModel]) {
        var output: [HomeConfiguratorProtocol] = []
        
        results.forEach({ cardModel in
            output.append(cardHomeSectionConfigurator(with: cardModel))
        })

        configuratorsDataSource = output.compactMap { $0 }
        registerForCells(viewModels: configuratorsDataSource)
        tableView?.reloadData()
    }
    
    // MARK: - Private functions
    
    private func cardHomeSectionConfigurator(with model: CardHomeViewModel) -> HomeConfiguratorProtocol {
        let configurator = CardHomeServiceConfigurator()
        configurator.model = model
        return configurator
    }
    
    private func registerForCells(viewModels: [HomeConfiguratorProtocol]) {
        let keys: Set<String> = Set(viewModels.map({ $0.reuseId }))
        keys.forEach { key in
            let objectClass: AnyClass? = NSClassFromString("CustomLeftSwipableCard." + key)
            guard let classType = objectClass as? UITableViewCell.Type else {
                return
            }
            self.tableView?.register(classType, forCellReuseIdentifier: key)
        }
    }
}

extension HomeTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configuratorsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = configuratorsDataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.reuseId, for: indexPath)
        cell.backgroundColor = .clear
        configurator.setupCell(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentConfigurator = configuratorsDataSource[indexPath.row]
        switch currentConfigurator.cellType {
        case .cardCell:
            delegate?.didCardTap()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(0, configuratorsDataSource[indexPath.row].cellHeight)
    }
}
