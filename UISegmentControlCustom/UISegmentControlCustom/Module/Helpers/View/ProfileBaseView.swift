//
//  ProfileBaseView.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 02.06.2023.
//

import UIKit

extension ProfileBaseView {
    struct Appearance {
        
        let blackColor: UIColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        let greenColor: UIColor = UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1)
        
        let backgroundColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        let backgroundImage: UIImage = UIImage(named: "ProfileBackground")!
        
        let avatarPhoto: UIImage = UIImage(named: "ProfileAvatar")!
        let avatarName: String = "Татьяна Марченко"
        
        let avatarImageHeight: CGFloat = 200
        
        let segmentTitle1: String = "Обо мне"
        let segmentTitle2: String = "Галерея"
        let segmentTitle3: String = "Отзывы"
        let segmentCornerRadius: CGFloat = 9
        let topOffset: CGFloat = 10
        let rightOffset: CGFloat = 16
        let AboutHeight: CGFloat = 32
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)]
        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)]
    }
}

class ProfileBaseView: UIView {
    
    private let appearance: Appearance
    
    // MARK: - Header View
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = appearance.backgroundImage
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = appearance.avatarPhoto
        avatar.layer.cornerRadius = 20
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private lazy var avatarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        label.text = appearance.avatarName
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: [appearance.segmentTitle1, appearance.segmentTitle2, appearance.segmentTitle3])
        segmentControl.tintColor = .red
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = appearance.greenColor
        segmentControl.setTitleTextAttributes(appearance.selectedAttributes, for: .selected)
        segmentControl.setTitleTextAttributes(appearance.normalAttributes, for: .normal)
        segmentControl.layer.cornerRadius = appearance.segmentCornerRadius
        segmentControl.layer.masksToBounds = true
        segmentControl.backgroundColor = .clear
        segmentControl.fixBackgroundColorWorkaround()
        segmentControl.layer.borderWidth = 1
        segmentControl.layer.borderColor = appearance.greenColor.cgColor
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    // MARK: - Footer View
    
    private lazy var switchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = appearance.blackColor
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.isHidden = true
        return label
    }()
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = appearance.greenColor
        switchView.isHidden = true
        return switchView
    }()
    
    
    override init(frame: CGRect) {
        appearance = Appearance()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader() -> UIView {
        let headerView = UIView()
        
        [backgroundImage, textLabel,
         switchLabel, switchView,
         avatarImage, avatarLabel, segmentedControl].forEach({
            $0.removeFromSuperview()
            headerView.addSubview($0)
        })
        
        addConstraints(view: headerView)
        
        return headerView
    }
    
    func setupFooter() -> UIView {
        let footerView = UIView()
        
        [switchView, switchLabel].forEach({
            footerView.addSubview($0)
            $0.isHidden = false
        })

        NSLayoutConstraint.activate([
            switchLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            switchLabel.trailingAnchor.constraint(equalTo: switchView.leadingAnchor, constant: -16),
            switchLabel.centerYAnchor.constraint(equalTo: switchView.centerYAnchor),
            
            switchView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            switchView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            switchView.widthAnchor.constraint(equalToConstant: 51),
            switchView.heightAnchor.constraint(equalToConstant: 31),
        ])
        return footerView
    }
    
    func selectedSegment(index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        
        addViews()
        addConstraints(view: self)
        updateTexts()
    }
}

// MARK: - private ProfileBaseView

private extension ProfileBaseView {

    
    func addViews() {
        [backgroundImage, textLabel,
         switchLabel, switchView,
         avatarImage, avatarLabel, segmentedControl].forEach({
            self.addSubview($0)
        })
    }
    
    func addConstraints(view: UIView) {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 229),
            
            avatarImage.heightAnchor.constraint(equalToConstant: appearance.avatarImageHeight),
            avatarImage.widthAnchor.constraint(equalToConstant: appearance.avatarImageHeight),
            avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            
            avatarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            avatarLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -8),
            
            segmentedControl.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 18),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func updateTexts() {
        switchLabel.text = "Переключить на профиль мастера"
    }
}
