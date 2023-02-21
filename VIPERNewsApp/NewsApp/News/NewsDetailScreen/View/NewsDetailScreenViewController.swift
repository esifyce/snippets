//
//  NewsDetailScreenViewController.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsDetailScreenViewController: BaseViewController {
    // MARK: - Property
    var presenter: NewsDetailScreenPresenterInput?
    
    // MARK: - Views
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.presenter?.viewDidLoad()
        configureActivityIndicator()
    }
}

// MARK: - NewsDetailScreenViewControllerInput
extension NewsDetailScreenViewController: NewsDetailScreenViewControllerInput {
    func showAlert() {
        let alert = UIAlertController(title: "Нет Интернета!", message: "Извините, к сожалению у вас нет интернета(", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - fileprivate NewsMainScreenViewController
fileprivate extension NewsDetailScreenViewController {
    func setupUI() {
        self.title = "News Detail"
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureActivityIndicator() {
        presenter?.startIndicator = self.startIndicator
        presenter?.stopIndicator = self.stopIndicator
    }
    
    func startIndicator() -> Void {
        self.showActivityIndicator()
    }
    
    func stopIndicator() -> Void {
        self.hideActivityIndicator()
    }
}
