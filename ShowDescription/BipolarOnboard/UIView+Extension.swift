//
//  UIView+Extension.swift
//  OnboardingScreens
//
//  Created by Sabir Myrzaev on 25.06.2021.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
