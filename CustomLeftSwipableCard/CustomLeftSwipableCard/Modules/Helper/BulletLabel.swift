//
//  BulletLabel.swift
//  CustomLeftSwipableCard
//
//  Created by Krasivo on 23.05.2023.
//

import UIKit

class BulletLabel: UILabel {
    private var bulletColor: UIColor = .black
    
    init(bulletColor: UIColor = .black) {
        self.bulletColor = bulletColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let markerSize: CGFloat = 5.0
        let markerRect = CGRect(x: 0, y: (font.lineHeight - markerSize) / 2, width: markerSize, height: markerSize)
        let markerPath = UIBezierPath(ovalIn: markerRect)
        bulletColor.setFill()
        markerPath.fill()
        
        let textRect = CGRect(x: markerSize + 4, y: 0, width: rect.width - markerSize - 4, height: rect.height)
        super.drawText(in: textRect)
    }
}
