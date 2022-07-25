//
//  UIWindow + Extension.swift
//  MedTech
//
//  Created by Krasivo on 26.07.2022.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

// How use

/*
if let keyWindow = UIWindow.key {
    // Do something
}
*/
