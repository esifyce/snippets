//
//  BaseBuilder.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol BaseBuilderProtocol {
    var tableView: UITableView { get }
   // func getFullTableSize() -> CGFloat
}

class BaseBuilder: BaseBuilderProtocol {
    var view: UIViewController
    var tableView: UITableView
    
    init(view: UIViewController, tableView: UITableView) {
        self.view = view
        self.tableView = tableView
    }
    
//    func getFullTableSize() -> CGFloat {
//        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
//        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//        
//        let topBarHeight = statusBarHeight +
//        (self.view.navigationController?.navigationBar.frame.height ?? 0.0)
//        
//        let fullTableSize = self.tableView.frame.size.height - topBarHeight
//        
//        return fullTableSize
//    }
}
