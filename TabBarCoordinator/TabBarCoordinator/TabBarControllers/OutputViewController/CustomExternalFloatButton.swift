//
//  CustomExternalFloatButton.swift
//  TabBarCoordinator
//
//  Created by Krasivo on 27.03.2023.
//

import UIKit

extension CustomExternalFloatButton {
    struct Appearance {
        let blurViewAlpha: CGFloat = 0.95

        let cropColor: UIColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 26.0/255.0, alpha: 0.5)
        let cropBorderWidth: CGFloat = 1.0
        let cropCornerRadius: CGFloat = .init(35).autoSize
        let cropShadowRadius: CGFloat = 0.5
        let cropShadowOpacity: Float = 0.1
    }
}

final class CustomExternalFloatButton: UIView {
    
    // MARK: - Property
    
    var outputCallBack: (() -> Void)?
    var text: String
    let appearance = Appearance()
    
    // MARK: - Views
    
    fileprivate lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = appearance.blurViewAlpha
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
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
        return ringView
    }()
    
    lazy var buttonView: UIView = {
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.layer.masksToBounds = true
        buttonView.layer.cornerRadius = 26
        
        return buttonView
    }()
    
    // MARK: - Init

    init(frame: CGRect = .init(x: .zero, y: .zero, width: 60, height: 60), cornerRadius: CGFloat = 30, text: String) {
        self.text = text
        super.init(frame: frame)
        ringView.layer.cornerRadius = cornerRadius
        ringView.layer.masksToBounds = true
        self.isUserInteractionEnabled = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0.44, green: 0.27, blue: 0.56, alpha: 1.0).cgColor, UIColor(red: 0.73, green: 0.52, blue: 0.89, alpha: 1.0).cgColor]
        gradientLayer.frame = self.bounds
        buttonView.layer.insertSublayer(gradientLayer, at: 0)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.addSubview(ringView)
        ringView.addSubview(buttonView)
        buttonView.addSubview(label)
        
        NSLayoutConstraint.activate([
            ringView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ringView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ringView.heightAnchor.constraint(equalToConstant: 60),
            ringView.widthAnchor.constraint(equalToConstant: 60),
            
            buttonView.centerYAnchor.constraint(equalTo: ringView.centerYAnchor),
            buttonView.centerXAnchor.constraint(equalTo: ringView.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 52),
            buttonView.widthAnchor.constraint(equalToConstant: 52),
            
            label.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
        ])
    }
    
    @objc
    func handleTap() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
              self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
          }) { [weak self] _ in
              self?.outputCallBack?()
              UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
                  self?.transform = CGAffineTransform.identity
              })
          }
    }
}



