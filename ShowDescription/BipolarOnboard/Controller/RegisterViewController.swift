//
//  RegisterViewController.swift
//  BipolarOnboard
//
//  Created by Sabir Myrzaev on 26.06.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var errorRegisterLabel: UILabel!
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        nameUserTextField.delegate = self
        errorRegisterLabel.isHidden = true
        
    }
    
    // MARK: - Actions
    
    @IBAction func createNewUserButton(_ sender: UIButton) {
        
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let nameUser = nameUserTextField.text {
            
            if !email.isEmpty && !password.isEmpty && !nameUser.isEmpty {
                Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                    
                    if let e = error {
                        if e.localizedDescription == "The password must be 6 characters long or more." {
                            self?.errorRegisterLabel.text = "Пароль должен содержать 6 символов"
                            self?.errorRegisterLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorRegisterLabel.isHidden = true
                            }
                        } else if e.localizedDescription == "The email address is badly formatted." {
                            self?.errorRegisterLabel.text = "Неверный формат почты"
                            self?.errorRegisterLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorRegisterLabel.isHidden = true
                            }
                        } else if e.localizedDescription == "The email address is already in use by another account." {
                            self?.errorRegisterLabel.text = "Это почта уже занята"
                            self?.errorRegisterLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorRegisterLabel.isHidden = true
                            }
                        }  else if e.localizedDescription == "Network error (such as timeout, interrupted connection or unreachable host) has occurred." {
                            self?.errorRegisterLabel.text = "Проверьте подключение интернета"
                            self?.errorRegisterLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorRegisterLabel.isHidden = true
                            }
                        } else {
                            self?.errorRegisterLabel.text = e.localizedDescription
                            self?.errorRegisterLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorRegisterLabel.isHidden = true
                            }
                        }
                        print(e.localizedDescription)
                        
                        
                    } else {
                        self?.performSegue(withIdentifier: "RegisterToOneTab", sender: self)
                        self?.emailTextField.text = ""
                        self?.passwordTextField.text = ""
                        self?.nameUserTextField.text = ""
                    }
                }
            } else {
                showAlert()
            }
        }
    }
    
    @IBAction func logInYourAccountButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Alert say error
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - TextField delegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameUserTextField {
        emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            self.view.endEditing(true)
            return true
        }
        return true
    }
}
