//
//  LoginViewModel.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import Foundation
import UIKit

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.white)
    var isLoggedIn = false
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].passwords {
            statusText.value = "Log in failed"
            statusColor.value = UIColor.red
            isLoggedIn = false
        } else {
            statusText.value = "Succesfull log in"
            statusColor.value = UIColor.green
            isLoggedIn = true
        }
    }
}
