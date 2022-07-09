//
//  ServerExtension.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

extension Dictionary {
    func toData() -> Data {
        (try? JSONSerialization.data(withJSONObject: self)) ?? Data()
    }
}

extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}
