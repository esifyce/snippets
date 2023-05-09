//
//  OutputViewController.swift
//  TabBarCoordinator
//
//  Created by Krasivo on 27.03.2023.
//

import UIKit
import MapKit

class OutputViewController: UIViewController {
    
    // MARK: -  Property
    
    var declineTapCallback: (() -> Void)?
    var chatTapCallback: (() -> Void)?
    var ratingTapCallback: (() -> Void)?
    var compabilityTapCallback: (() -> Void)?
    
    // MARK: - Views
    
    
    fileprivate lazy var stackContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        stackView.backgroundColor = .red
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 40
        return stackView
    }()
    
    fileprivate lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.95
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = true
        return blurEffectView
    }()
    
    fileprivate lazy var declineButtonView: CustomPrimaryFloatButton = {
        let declineView = CustomPrimaryFloatButton(iconImage: .init(named: "declineIcon")!, type: .declineButton)
        declineView.outputCallBack = {
            print("tap decline")
        }
        declineView.translatesAutoresizingMaskIntoConstraints = false
        return declineView
    }()
    
    fileprivate lazy var chatButtonView: CustomPrimaryFloatButton = {
        let chatView = CustomPrimaryFloatButton(iconImage: .init(named: "chatIcon")!, type: .chatButton)
        chatView.translatesAutoresizingMaskIntoConstraints = false
        chatView.outputCallBack = {
            print("tap chat")
        }
        return chatView
    }()
    
    fileprivate lazy var ratingButtonView: CustomExternalFloatButton = {
        let ratingView = CustomExternalFloatButton(text: "3.8")
        ratingView.outputCallBack = {
            print("tap rating")
        }
        return ratingView
    }()
    
    fileprivate lazy var compabilityButtonView: CustomExternalFloatButton = {
        let compabilityView = CustomExternalFloatButton(text: "88%")
        compabilityView.translatesAutoresizingMaskIntoConstraints = false
        compabilityView.outputCallBack = {
            print("tap rating")
        }
        return compabilityView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        [declineButtonView, ratingButtonView, compabilityButtonView, chatButtonView].forEach({
            stackContainer.addArrangedSubview($0)
        })
    }

 
}

fileprivate extension OutputViewController {
    
    func setupUI() {
        
        self.view.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            stackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackContainer.heightAnchor.constraint(equalToConstant: 80),
            stackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            
            declineButtonView.heightAnchor.constraint(equalToConstant: 64),
            ratingButtonView.heightAnchor.constraint(equalToConstant: 60),
            compabilityButtonView.heightAnchor.constraint(equalToConstant: 60),
            chatButtonView.heightAnchor.constraint(equalToConstant: 64),
            
            declineButtonView.widthAnchor.constraint(equalToConstant: 64),
            ratingButtonView.widthAnchor.constraint(equalToConstant: 60),
            compabilityButtonView.widthAnchor.constraint(equalToConstant: 60),
            chatButtonView.widthAnchor.constraint(equalToConstant: 64),
        ])
    }
    
    @objc
    func didTapDecline() {
        declineTapCallback?()
    }
    
    @objc
    func didTapRating() {
        ratingTapCallback?()
    }
    
    @objc
    func didTapCompability() {
        compabilityTapCallback?()
    }
    
    @objc
    func didTapMessage() {
        chatTapCallback?()
    }
}
