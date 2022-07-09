//
//  EnterLogin.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

struct AccessToken: Codable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try? values.decodeIfPresent(String.self, forKey: .accessToken)
    }
}

struct EnterLogin: Codable {
    let email: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email, password
    }
}
