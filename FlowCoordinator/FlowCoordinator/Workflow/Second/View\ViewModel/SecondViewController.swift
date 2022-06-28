//
//  SecondViewController.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import UIKit

class SecondViewController: UIViewController, CoordinatorViewControllerProtocol {
    
    // MARK: - Property
    
    var secondViewModelProtocol: SecondViewModelProtocol?
    
    // MARK: - View
    
    private let logoutButton: UIButton = {
       let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    required init(viewModel: CoordinatorViewModelProtocol) {
        self.secondViewModelProtocol = viewModel as? SecondViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        configureUI()
    }
    
    // MARK: - Selctors
    
    @objc
    private func logoutTappedButton() {
        secondViewModelProtocol?.logoutWithCredetials()
    }
    
    // MARK: ConfigureUI
    
    private func configureUI() {
        view.addSubview(logoutButton)
        
        setConstraints()
        addObserverTarget()
    }
    
    private func setConstraints() {
        
        let constraints = [
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addObserverTarget() {
        logoutButton.addTarget(self, action: #selector(logoutTappedButton), for: .touchUpInside)
    }
}
