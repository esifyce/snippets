//
//  LoginViewController.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import UIKit

class LoginViewController: UIViewController, CoordinatorViewControllerProtocol {
    
    // MARK: - Property
    
    private var loginViewModel: LoginViewModelProtocol?
    
    // MARK: - Views
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    required init(viewModel: CoordinatorViewModelProtocol) {
        self.loginViewModel = viewModel as? LoginViewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        configureUI()
    }
    
    // MARK: - Selctors
    
    @objc
    private func loginTappedButton() {
        loginViewModel?.loginWithCredetials()
    }
    
    // MARK: ConfigureUI
    
    private func configureUI() {
        view.addSubview(loginButton)
        
        setConstraints()
        addObserverTarget()
    }
    
    private func setConstraints() {
        
        let constraints = [
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addObserverTarget() {
        loginButton.addTarget(self, action: #selector(loginTappedButton), for: .touchUpInside)
    }
}


