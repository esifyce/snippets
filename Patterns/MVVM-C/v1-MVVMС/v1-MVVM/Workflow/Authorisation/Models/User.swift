//
//  User.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import Foundation

struct User {
    let login: String?
    let passwords: String?
}

extension User {
    static var logins = [
        User(login: "Lexone", passwords: "12345")
    ]
}
