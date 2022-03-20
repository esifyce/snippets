//
//  UIButton.swift
//  withoutStoryboard8
//
//  Created by Sabir Myrzaev on 3/3/22.
//

import Foundation
import UIKit


extension UIButton {
    
    convenience init(title: String,
                     backgroundColor: UIColor,
                     titleColor: UIColor,
                     isShadow: Bool,  //тени
                     cornerRadius: CGFloat = 5) {
        
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor.blue.cgColor
        
        if isShadow {
            
            self.layer.shadowRadius = 5
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            
        }
    }
}
