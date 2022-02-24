//
//  LoginViewController.swift
//  BipolarOnboard
//
//  Created by Sabir Myrzaev on 25.06.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let reachability = try! Reachability()
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    @IBOutlet weak var errorLoginLabel: UILabel!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLoginTextField.delegate = self
        passwordLoginTextField.delegate = self
        errorLoginLabel.isHidden = true
        
    }
    
    // MARK: - Walktrough
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if UserDefaults.standard.bool(forKey: "hasViewedWalktrough") {
            return
        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            walkthroughViewController.modalPresentationStyle = .fullScreen
            walkthroughViewController.modalTransitionStyle = .crossDissolve
            present(walkthroughViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - NetworkProblem
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                self.view.window?.rootViewController?.dismiss(animated: true)
            }
            self.reachability.whenUnreachable = { _ in
                print("Not reachable")
                if let networkVC = self.storyboard?.instantiateViewController(identifier: "NetworkErrorViewController") as? NetworkErrorViewController {
                    self.present(networkVC, animated: true)
                }
            }
            
            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
    
    deinit {
        reachability.stopNotifier()
    }
    
    
    // MARK: - Actions
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if let email = emailLoginTextField.text, let password = passwordLoginTextField.text {
            if !email.isEmpty && !password.isEmpty {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    if let e = error {
                        if e .localizedDescription == "The password is invalid or the user does not have a password." {
                            self?.errorLoginLabel.text = "Пароль неверный, а ты пробовал ввести пароль 'Пароль' ? "
                            self?.errorLoginLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorLoginLabel.isHidden = true
                            }
                        } else if e.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                            self?.errorLoginLabel.text = "Ищешь призрака? Пользователя не существует..."
                            self?.errorLoginLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorLoginLabel.isHidden = true
                            }
                        } else if e.localizedDescription == "The email address is badly formatted." {
                            self?.errorLoginLabel.text = "Когда хозяин забыл собаку... '@'"
                            self?.errorLoginLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorLoginLabel.isHidden = true
                            }
                        } else if e.localizedDescription == "Network error (such as timeout, interrupted connection or unreachable host) has occurred." {
                            self?.errorLoginLabel.text = "Проверьте подключение интернета"
                            self?.errorLoginLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorLoginLabel.isHidden = true
                            }
                        } else {
                            self?.errorLoginLabel.text = e.localizedDescription
                            self?.errorLoginLabel.isHidden = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                                self?.errorLoginLabel.isHidden = true
                            }
                        }
                        
                        print(e.localizedDescription)
                    } else {
                        self?.performSegue(withIdentifier: "RegisterToOneTab", sender: nil)
                        self?.emailLoginTextField.text = ""
                        self?.passwordLoginTextField.text = ""
                    }
                }
            } else {
                showAlert()
            }
        }
    }
    
    // MARK: - Alert say error
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - TextField delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField == emailLoginTextField else {
            self.view.endEditing(true)
            return true
        }
        passwordLoginTextField.becomeFirstResponder()
        return true
    }
}
