//
//  LoginVC.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/9/21.
//

import UIKit

class LoginVC: UIViewController {
    var loginVM: LoginVMProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        view.backgroundColor = .blue
        createLoginButton()
    }

    init(viewModel: LoginVMProtocol) {
        loginVM = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createLoginButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
    }

    @objc private func loginAction() {
        loginVM?.loginWithCredentials()
    }
}
