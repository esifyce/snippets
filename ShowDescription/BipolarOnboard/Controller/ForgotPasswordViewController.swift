//
//  ForgotPasswordViewController.swift
//  BipolarOnboard
//
//  Created by Sabir Myrzaev on 28.06.2021.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailResetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailResetTextField.delegate = self
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        if let email = emailResetTextField.text {
            if !email.isEmpty {
                Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                    if let e = error {
                        print(e.localizedDescription)
                    } else {
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            } else {
               showAlert()
            }
        }
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Alert say error
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
