//
//  CustomFloatButton.swift
//  TabBarCoordinator
//
//  Created by Krasivo on 27.03.2023.
//

import UIKit

extension CGFloat {
    var autoSize: CGFloat { return UIScreen.main.bounds.height * self / 812.0 }
}

enum PrimaryType {
    case declineButton
    case chatButton
}

extension CustomPrimaryFloatButton {
    struct Appearance {
        let blurViewAlpha: CGFloat = 0.95

        let cropColor: UIColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 26.0/255.0, alpha: 0.5)
        let cropBorderWidth: CGFloat = 1.0
        let cropShadowRadius: CGFloat = 0.5
        let cropShadowOpacity: Float = 0.1
    }
}

final class CustomPrimaryFloatButton: UIView {
    
    // MARK: - Property
    
    var outputCallBack: (() -> Void)?
    let iconImage: UIImage
    var typeBool = false
    var type: PrimaryType
    let appearance = Appearance()
    
    // MARK: - Views
    
    fileprivate lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = appearance.blurViewAlpha
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        return blurEffectView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = iconImage
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    lazy var ringView: UIView = {
        let ringView = UIView()
        ringView.translatesAutoresizingMaskIntoConstraints = false
        ringView.addSubview(blurView)
        ringView.backgroundColor = .clear
        ringView.clipsToBounds = true
        ringView.layer.borderWidth = appearance.cropBorderWidth
        ringView.layer.borderColor = appearance.cropColor.cgColor
        
        ringView.layer.masksToBounds = false
        ringView.layer.shadowRadius = appearance.cropShadowRadius
        ringView.layer.shadowOpacity = appearance.cropShadowOpacity
        ringView.layer.shadowColor = UIColor.white.cgColor
        ringView.layer.shadowOffset = CGSize(width: 0 , height: 1)
        ringView.isUserInteractionEnabled = false
        return ringView
    }()
    
    lazy var buttonView: UIView = {
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.layer.masksToBounds = true
        buttonView.layer.cornerRadius = 28
        buttonView.isUserInteractionEnabled = false
        
        return buttonView
    }()
    
    // MARK: - Init

    init(frame: CGRect = .init(x: .zero, y: .zero, width: 64, height: 64), cornerRadius: CGFloat = 32, backgroundImage: UIImage = .init(named: "primaryBackground")!, iconImage: UIImage, type: PrimaryType) {
        self.type = type
        self.iconImage = iconImage
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        
        self.typeBool = type == .declineButton

        let backgroundColor = UIColor(patternImage: backgroundImage)
        buttonView.backgroundColor = backgroundColor
        
        ringView.layer.masksToBounds = true
        ringView.layer.cornerRadius = cornerRadius
        
        setupUI()
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.addSubview(ringView)
        ringView.addSubview(buttonView)
        buttonView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            ringView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ringView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ringView.heightAnchor.constraint(equalToConstant: 64),
            ringView.widthAnchor.constraint(equalToConstant: 64),
            
            buttonView.centerYAnchor.constraint(equalTo: ringView.centerYAnchor),
            buttonView.centerXAnchor.constraint(equalTo: ringView.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 56),
            buttonView.widthAnchor.constraint(equalToConstant: 56),
            
            imageView.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 28),
            imageView.widthAnchor.constraint(equalToConstant: 28),
        ])
    }
        
    @objc
    func handleTap() {
        typeBool ? animDeclineIcon() : animChatIcon()
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
              self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
          }) { [weak self] _ in
              self?.outputCallBack?()
              UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
                  self?.transform = CGAffineTransform.identity
              })
          }
    }
    
    func animDeclineIcon() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi)
        rotationAnimation.duration = 0.6
        rotationAnimation.isCumulative = true
        self.imageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func animChatIcon() {
        UIView.animate(withDuration: 0.2, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
         }, completion: { [weak self] _ in
             UIView.animate(withDuration: 0.2) {
                 self?.imageView.transform = CGAffineTransform.identity
             }
         })
    }
}




