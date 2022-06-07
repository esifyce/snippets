//
//  NSObject.swift
//  MedTech
//
//  Created by Krasivo on 07.06.2022.
//

import UIKit

extension NSObject {
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    func computedHeight(_ value: CGFloat) -> CGFloat {
        screenHeight * value / 812.0
    }
    func computedWeight(_ value: CGFloat) -> CGFloat {
        screenWidth * value / 375.0
    }
}

extension NSObject {
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    func computedHeight<T: BinaryFloatingPoint>(_ value: T) -> T {
        T(screenHeight) * value / T(812.0)
    }
    func computedWeight<T: BinaryFloatingPoint>(_ value: T) -> T {
        T(screenWidth) * value / T(375.0)
    }
}
