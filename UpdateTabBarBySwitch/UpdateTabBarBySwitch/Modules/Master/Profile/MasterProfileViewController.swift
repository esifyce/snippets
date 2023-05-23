//
//  MasterProfileViewController.swift
//  UpdateTabBarBySwitch
//
//  Created by Krasivo on 22.05.2023.
//

import UIKit

class MasterProfileViewController: UIViewController {
    
    var didSendEventClosure: (() -> Void)?
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.addTarget(self, action: #selector(switchChanged), for: .touchUpInside)
        return switchView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        textLabel.text = "MASTER PROFILE"
        view.addSubview(textLabel)
        view.addSubview(switchView)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            switchView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50),
            switchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        didSendEventClosure?()
        print(value)
    }
}
