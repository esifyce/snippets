//
//  Extension + UIColorHEX.swift
//  ExtensionTest
//
//  Created by Sabir Myrzaev on 12.07.2021.
//

import UIKit

extension UIColor {
    // HEX
    convenience init(hexColor: String, alpha: CGFloat = 1) {
        let hexColor: String = hexColor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexColor)
        if (hexColor.hasPrefix("#")) {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
// HEX usage
 //static let midGrey = UIColor(hexColor: "#3f3f3f")
 //static let midGreyAlpha = UIColor(hexColor: "#CCCCCC", alpha: 0.5)
 }
