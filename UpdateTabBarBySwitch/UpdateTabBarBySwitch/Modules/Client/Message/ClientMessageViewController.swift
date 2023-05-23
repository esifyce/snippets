//
//  ClientMessageViewController.swift
//  UpdateTabBarBySwitch
//
//  Created by Krasivo on 22.05.2023.
//

import UIKit

class ClientMessageViewController: UIViewController {
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        textLabel.text = "CLIENT MESSAGE"
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
}
