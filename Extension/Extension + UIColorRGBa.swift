//
//  Extension + UIColorRGBaColor.swift
//  ExtensionTest
//
//  Created by Sabir Myrzaev on 12.07.2021.
//

import UIKit

extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
