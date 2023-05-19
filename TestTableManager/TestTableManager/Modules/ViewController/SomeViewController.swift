//
//  SomeViewController.swift
//  TestTableManager
//
//  Created by Krasivo on 17.05.2023.
//

import UIKit

class SomeViewController: UIViewController {
    
    let tableManager: ServiceTableManagerProtocol = ServiceTableManager()
    
    lazy var category: [ServiceModel] = [
        .init(titleText: "Направление услуги*", serviceText: "Маникюр"),
        .init(titleText: "Категория услуги*", serviceText: "Классический, детский, быстрый, очень качественный"),
        .init(titleText: "Местоположение*", serviceText: "Москва, Россия"),
        .init(titleText: "Опыт работы*", serviceText: "Менее 1 года"),
        .init(titleText: "Описание услуги", serviceText: ""),
        .init(titleText: "Фотографии работ", serviceText: "")
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        tableManager.injectTable(tableView, delegate: self)
        tableManager.displayServiceResult(category)
        
        title = "Добавить услугу"
    }
    
    
}

extension SomeViewController {
    func setupFooter(isEnabled: Bool) {
        tableView.tableFooterView = nil
        
        let activeBagroundColor: UIColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        let inActiveBagroundColor: UIColor = UIColor(red: 0.904, green: 0.904, blue: 0.904, alpha: 1)
        let activeTextColor: UIColor = .white
        let inActiveTextColor: UIColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 90))
        customView.backgroundColor = UIColor.clear
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = isEnabled ? activeBagroundColor : inActiveBagroundColor
        button.isEnabled = isEnabled
        button.setTitle("Создать услугу", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(isEnabled ? activeTextColor : inActiveTextColor, for: .normal)
        customView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
        ])
        
        tableView.tableFooterView = customView
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
        
        addViews()
        addConstraints()
        setupFooter(isEnabled: true)
    }
    
    func addViews() {
        [tableView].forEach({ view.addSubview($0) })
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc func buttonAction() {
        print("test")
    }
}

extension SomeViewController: ServiceTableManagerDelegate {
    func didDescriptionTapped() {
        print("description")
    }
    
    func didDirectionTapped() {
        print("directional")
    }
    
    func didCategoryTapped() {
        print("category")
    }
    
    func didLocationTapped() {
        print("location")
    }
    
    func didPracticeTapped() {
        print("practice")
    }
    
    
}
