//
//  NewsMainScreenViewController.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

final class NewsMainScreenViewController: BaseViewController {
    // MARK: - Property
    var presenter: NewsMainScreenPresenterInput?
    
    // MARK: - Views
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    fileprivate let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.presenter?.viewDidLoad()
        configureActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    @objc func refreshData() {
        self.presenter?.refreshData()
        refreshControl.endRefreshing()
    }

}

// MARK: - NewsMainScreenViewControllerInput
extension NewsMainScreenViewController: NewsMainScreenViewControllerInput {
    func showAlert() {
        let alert = UIAlertController(title: "Нет Интернета!", message: "Извините, к сожалению у вас нет интернета(", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - fileprivate NewsMainScreenViewController
fileprivate extension NewsMainScreenViewController {
    func setupUI() {
        self.title = "News"
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
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
