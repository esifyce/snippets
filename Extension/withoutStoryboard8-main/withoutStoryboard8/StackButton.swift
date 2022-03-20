//
//  StackButton.swift
//  withoutStoryboard8
//
//  Created by Sabir Myrzaev on 3/3/22.
//

import Foundation
import UIKit

class StackButton: UIView {
    init(button: UIButton){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(button)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
