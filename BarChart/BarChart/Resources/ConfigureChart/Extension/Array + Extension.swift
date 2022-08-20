//
//  Array + Extension.swift
//  BarChart
//
//  Created by Krasivo on 21.08.2022.
//

import Foundation

extension Array {
    func safeValue(at index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}
