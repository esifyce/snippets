//
//  View.swift
//  VIPERarch
//
//  Created by Krasivo on 07.07.2022.
//

import UIKit

// ViewController
// protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView {
    // MARK: - Propeprty
    
    var presenter: AnyPresenter?
    
    // MARK: - Views
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let label: UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.isHidden = true
        return lbl
    }()
    
    var users: [User] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    // MARK: - Configure
    
    private func configure() {
        setViews()
        setConstraints()
        
        view.backgroundColor = .systemBlue
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setViews() {
        view.addSubview(tableView)
        view.addSubview(label)
    }
    
    private func setConstraints() {
        
    }
    
    // MARK: - Helpers
    
    func update(with users: [User]) {
        print("got users ")
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.label.isHidden = true
        }
    }
    
    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.users = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
}

// MARK: - UITableViewDataSource

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension UserViewController: UITableViewDelegate {
    
}
