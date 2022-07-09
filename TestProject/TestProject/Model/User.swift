//
//  User.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

// MARK: - User
//struct User: Codable {
//    let patientID: Int?
//    let name, email, password: String?
//    let role: String?
//    let active: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case patientID = "patient_id"
//        case name, email, password, role, active
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        patientID = try? values.decodeIfPresent(Int.self, forKey: .patientID)
//        name = try? values.decodeIfPresent(String.self, forKey: .name)
//        email = try? values.decodeIfPresent(String.self, forKey: .email)
//        password = try? values.decodeIfPresent(String.self, forKey: .password)
//        role = try? values.decodeIfPresent(String.self, forKey: .role)
//        active = try? values.decodeIfPresent(Bool.self, forKey: .active)
//    }
//}
