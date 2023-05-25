//
//  HomeViewController.swift
//  CustomLeftSwipableCard
//
//  Created by Krasivo on 23.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableManager: HomeTableManagerProtocol = HomeTableManager()
    
    lazy var category: [CardHomeViewModel] = [
        .init(cardTitleLabel: "Косметология",
              cardImage: "manik",
              avatarUserImage: "avatar",
              nameUserLabel: "Татьяна Марченко",
              locationImage: "location",
              locationLabel: "Москва, Щелковский район",
              practiceImage: "practice",
              practiceLabel: "менее 1 года",
              firstService: "микродермабразийныймикродермабразийный",
              secondServiceLabel: "микродермабразийныймикродермабразийный",
              thirdServiceLabel: "микродермабразийныймикродермабразийный"),
        .init(cardTitleLabel: "Косметология",
              cardImage: "manik",
              avatarUserImage: "avatar",
              nameUserLabel: "Татьяна Марченко",
              locationImage: "location",
              locationLabel: "Москва, Щелковский район",
              practiceImage: "practice",
              practiceLabel: "менее 1 года",
              firstService: "микродермабразийный",
              secondServiceLabel: "микродермабразийный",
              thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
        
            .init(cardTitleLabel: "Косметология",
                  cardImage: "manik",
                  avatarUserImage: "avatar",
                  nameUserLabel: "Татьяна Марченко",
                  locationImage: "location",
                  locationLabel: "Москва, Щелковский район",
                  practiceImage: "practice",
                  practiceLabel: "менее 1 года",
                  firstService: "микродермабразийный",
                  secondServiceLabel: "микродермабразийный",
                  thirdServiceLabel: "микродермабразийный"),
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

        tableView.separatorInset = .init(top: .zero, left: .zero, bottom: 32, right: .zero)
    }
}

extension HomeViewController {
    func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
        
        addViews()
        addConstraints()
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

extension HomeViewController: HomeTableManagerDelegate {
    func didCardTap() {
        print("tapCard")
    }
}
