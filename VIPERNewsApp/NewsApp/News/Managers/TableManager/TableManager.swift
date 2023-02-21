//
//  TableManager.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol TableManagerDelegate: AnyObject {
    func loadNextTablePage()
}

protocol TableManagerProtocol: AnyObject {
    func setupTableView(tableView: UITableView, delegate: TableManagerDelegate?)
    func fillViewModels(viewModels: [CellType])
    func showScreen(tableView: UITableView, cellForRowAt indexPath: IndexPath, viewModels: [CellType]) -> UITableViewCell
}

final class TableManager: NSObject, TableManagerProtocol {
    private weak var tableView: UITableView?
    weak var delegate: TableManagerDelegate?
    private var viewModels = [CellType]()
    
    func setupTableView(tableView: UITableView, delegate: TableManagerDelegate? = nil) {
        self.tableView = tableView
        self.tableView?.separatorStyle = .none
        self.tableView?.isScrollEnabled = false
        self.tableView?.dataSource = self
        self.delegate = delegate
        self.tableView?.delegate = self
    }
    
    func fillViewModels(viewModels: [CellType]) {
        self.viewModels = viewModels
        self.registerForCells(viewModels: viewModels)
        self.tableView?.reloadData()
    }
    
    func showScreen(tableView: UITableView, cellForRowAt indexPath: IndexPath, viewModels: [CellType]) -> UITableViewCell {
        let model = viewModels[indexPath.row]
        
        switch model {
        case .spacerCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellsId, for: indexPath) as? SpacerCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.cellConfiguration(model: model)
            return cell
            
        case .labelCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellsId, for: indexPath) as? LabelCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.cellConfiguration(model: model)
            return cell
            
        case .newsMainCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellsId, for: indexPath) as? NewsMainCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.cellConfiguration(model: model)
            return cell
        case .newsDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellsId, for: indexPath) as? NewsDetailCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.cellConfiguration(model: model)
            return cell
        }
    }
}

// MARK: - fileprivate TableManager
fileprivate extension TableManager {
    func registerForCells(viewModels: [CellType]) {
        let keys: Set<String> = Set(viewModels.map({ $0.cellsId }))
        keys.forEach { key in
            let objectClass: AnyClass?  = NSClassFromString("NewsApp." + key)
            guard let classType = objectClass as? UITableViewCell.Type else {
                return
            }
            
            self.tableView?.register(classType, forCellReuseIdentifier: key)
        }
    }
}

// MARK: - Table view data source implementation
extension TableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return showScreen(tableView: tableView, cellForRowAt: indexPath, viewModels: viewModels)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(0, viewModels[indexPath.row].general.cellHeight)
    }
}

// MARK: - Table view delegate implementation
extension TableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModels[indexPath.row]
        
        if let cell = tableView.cellForRow(at: indexPath) as? NewsDetailCell {
            model.deepLink?.tapAction?(cell.deepLinkLabel.text ?? "")
        }
        
        model.general.tapAction?()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == .zero {
            print("start")
        } else if indexPath.row == self.viewModels.count - 1 {
            self.delegate?.loadNextTablePage()
            print("end")
        }
    }
}
