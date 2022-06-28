//
//  LoginVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class LoginVC: UIViewController, VCProtocol {
    var loginVM: LoginVMProtocol?
    
    private var loginButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        return button
    }

    required init(viewModel: VMProtocol) {
        self.loginVM = viewModel as? LoginVMProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: UI
    private func setupUI() {
        self.title = "Login"
        view.backgroundColor = .lightGray
        view.addSubview(loginButton)
    }
    
    // MARK: Actions
    @objc private func loginAction() {
        loginVM?.loginWithCredentials()
    }
}
