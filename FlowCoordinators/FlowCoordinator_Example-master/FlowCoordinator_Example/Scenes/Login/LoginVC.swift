//
//  LoginVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, VCProtocol {
    var loginVM: LoginVMProtocol?

    required init(viewModel: VMProtocol) {
        self.loginVM = viewModel as? LoginVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupLoginButton()
    }

    // MARK: UI
    private func setupLoginButton() {
        let loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        loginButton.center = view.center
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        view.addSubview(loginButton)
    }

    // MARK: Actions
    @objc private func loginAction() {
        loginVM?.loginWithCredentials()
    }
}
