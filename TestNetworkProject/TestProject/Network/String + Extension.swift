//
//  String + Extension.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

extension String {
    func getURL() -> URL? {
        URL(string: self)
    }
}
