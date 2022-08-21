//
//  PointEntry.swift
//  BarLineChart
//
//  Created by Krasivo on 21.08.2022.
//

import Foundation

struct PointEntry {
    let value: Int
    let title: String
}

extension PointEntry: Comparable {
    static func <(lhs: PointEntry, rhs: PointEntry) -> Bool {
        return lhs.value < rhs.value
    }
    static func ==(lhs: PointEntry, rhs: PointEntry) -> Bool {
        return lhs.value == rhs.value
    }
}
