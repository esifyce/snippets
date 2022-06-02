//
//  LoginViewController.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class LoginViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?
    var viewModel:  LoginViewModel?

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViewModel()
        label.textColor = .white
    }
    
    func bindViewModel() {
        viewModel?.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        }
        
        viewModel?.statusColor.bind { statusColor in
            DispatchQueue.main.async {
                self.label.textColor = statusColor
            }
        }
    }

    @IBAction func loginButton(_ sender: UIButton) {
        viewModel?.userButtonPressed(login: loginField.text ?? "",
                                    password: passField.text ?? "")
        if viewModel!.isLoggedIn {
            coordinator?.isLoggedIn = viewModel!.isLoggedIn
            coordinator?.showMain(login: loginField.text ?? "")
        }
    }
    
}

