//
//  AlertExtension.swift
//  TableView
//
//  Created by Sabir Myrzaev on 03/13/22.
//

import UIKit
import KeychainSwift

extension UIViewController {
    typealias CompletionHandler = (_ success: Bool) -> Void

    func callSimpleAlert(title: String, message: String, preferredStyle: UIAlertController.Style, okActionHandler: @escaping ((UIAlertAction)->())) {
        
        let alertController = UIAlertController(title: title, message: message,  preferredStyle: preferredStyle)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func callActionSheetStyleAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style, firstButtonTitle: String?, firstButtonStyle: UIAlertAction.Style, firstButtonActionHandler: @escaping ((UIAlertAction)->()), secondButtonTitle: String?, secondButtonStyle: UIAlertAction.Style, secondButtonActionHandler: @escaping ((UIAlertAction)->()), thirdButtonTitle: String?, thirdButtonStyle: UIAlertAction.Style, thirdButtonActionHandler: @escaping ((UIAlertAction)->())) {
    
        let actionSheeetAlertController = UIAlertController(title: title, message: message,  preferredStyle: preferredStyle)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let firstButtonAction = UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: firstButtonActionHandler)
        let secondButtonAction = UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler: secondButtonActionHandler)
        let thirdButtonAction = UIAlertAction(title: thirdButtonTitle, style: thirdButtonStyle, handler: thirdButtonActionHandler)
        
        actionSheeetAlertController.addAction(firstButtonAction)
        actionSheeetAlertController.addAction(secondButtonAction)
        actionSheeetAlertController.addAction(thirdButtonAction)
        actionSheeetAlertController.addAction(cancelAction)
        present(actionSheeetAlertController, animated: true, completion: nil)
        
    }
    
    func createPasswordAlert(key: String, message: String?) {
        let keychain = KeychainSwift()
        let alertController = UIAlertController(title: "Create password", message: message,  preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let password = alertController.textFields![0] as UITextField
            keychain.set(password.text!, forKey: key)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            let password = "WithoutPassword"
            keychain.set(password, forKey: key)
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func askPasswordAlert(key: String, finished: @escaping () -> Void) {
        let keychain = KeychainSwift()
        let password = keychain.get(key)
        if password != nil {
            let passAlert = UIAlertController(title: "Enter your password to continue", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                let enteredPassword = passAlert.textFields![0] as UITextField
                
                if password == enteredPassword.text {
                    finished()
//                    self.dismiss(animated: true, completion: nil)
                    
                } else {
                    passAlert.textFields![0].text = ""
                    self.present(passAlert, animated: true, completion: nil)
                }
            }
            
            passAlert.addTextField { (textField) in
                textField.placeholder = "Password"
            }
            passAlert.addAction(cancelAction)
            passAlert.addAction(okAction)
            present(passAlert, animated: true, completion: nil)
        }
    }
    
    func nextAlertBlock(index: Int, selectedItems: [URL], key: String?, finished: @escaping () -> Void) {
        if index < selectedItems.count {
            self.createPasswordForFolders(index: index, selectedItems: selectedItems, key: key!, finished: finished)
        }
    }
    
    func createPasswordForFolders(index: Int, selectedItems: [URL], key: String,  finished: @escaping () -> Void) {
        let keychain = KeychainSwift()
        let alertController = UIAlertController(title: "Create password", message: "For \(selectedItems[index].lastPathComponent) folder",  preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let password = alertController.textFields![0] as UITextField
            keychain.set(password.text!, forKey: selectedItems[index].lastPathComponent)
            finished()
            if index + 1 < selectedItems.count {
                self.nextAlertBlock(index: index + 1, selectedItems: selectedItems, key: selectedItems[index + 1].lastPathComponent, finished: finished)
            }
            
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func createPasswordForFolder(key: String, finished: @escaping () -> Void) {
        let keychain = KeychainSwift()
        let alertController = UIAlertController(title: "Create password", message: "For \(key) folder",  preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let password = alertController.textFields![0] as UITextField
            keychain.set(password.text!, forKey: key)
            finished()
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

