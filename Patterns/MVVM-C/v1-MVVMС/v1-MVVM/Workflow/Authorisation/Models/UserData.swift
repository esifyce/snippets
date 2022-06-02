//
//  UserData.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
    var email: String?
    var phone: String?
}

extension UserData {
    static var userData = UserData(name: "Semen", city: "Bishkek", email: "email@mail.ru", phone: "99944123")
}
