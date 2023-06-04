////
////  SegmentView.swift
////  UISegmentControlCustom
////
////  Created by Krasivo on 01.06.2023.
////
//
//import UIKit
//
//protocol SegmentViewDelegate: AnyObject {
//    func changedSwitchValue()
//}
//
//extension SegmentView {
//    struct Appearance {
//        
//        let blackColor: UIColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
//        let greenColor: UIColor = UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1)
//        
//        let backgroundColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
//        let backgroundImage: UIImage = UIImage(named: "ProfileBackground")!
//        
//        let avatarPhoto: UIImage = UIImage(named: "ProfileAvatar")!
//        let avatarName: String = "Татьяна Марченко"
//
//        let avatarImageHeight: CGFloat = 200
//        
//        let segmentTitle1: String = "Обо мне"
//        let segmentTitle2: String = "Галерея"
//        let segmentTitle3: String = "Отзывы"
//        let segmentCornerRadius: CGFloat = 9
//        let topOffset: CGFloat = 10
//        let rightOffset: CGFloat = 16
//        let segmentHeight: CGFloat = 32
//        let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)]
//        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)]
//    }
//}
//
//final class SegmentView: UIView {
//    
//    // MARK: - Property
//    
//    private let appearance: Appearance
//    weak var delegate: SegmentViewDelegate?
//    
//    // MARK: - Views
//    
//    private lazy var backgroundImage: UIImageView = {
//       let backgroundImage = UIImageView()
//        backgroundImage.image = appearance.backgroundImage
//        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
//        return backgroundImage
//    }()
//    
//    private lazy var avatarImage: UIImageView = {
//       let avatar = UIImageView()
//        avatar.image = appearance.avatarPhoto
//        avatar.layer.cornerRadius = 20
//        avatar.translatesAutoresizingMaskIntoConstraints = false
//        return avatar
//    }()
//    
//    private lazy var avatarLabel: UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        label.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
//        label.text = appearance.avatarName
//        label.textAlignment = .center
//        label.numberOfLines = .zero
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var segmentControl: UISegmentedControl = {
//        let segmentControl = UISegmentedControl(items: [appearance.segmentTitle1, appearance.segmentTitle2, appearance.segmentTitle3])
//        segmentControl.tintColor = .red
//        segmentControl.selectedSegmentIndex = 0
//        segmentControl.selectedSegmentTintColor = appearance.greenColor
//        segmentControl.setTitleTextAttributes(appearance.selectedAttributes, for: .selected)
//        segmentControl.setTitleTextAttributes(appearance.normalAttributes, for: .normal)
//        segmentControl.layer.cornerRadius = appearance.segmentCornerRadius
//        segmentControl.layer.masksToBounds = true
//        segmentControl.backgroundColor = .clear
//        segmentControl.fixBackgroundColorWorkaround()
//        segmentControl.layer.borderWidth = 1
//        segmentControl.layer.borderColor = appearance.greenColor.cgColor
//        segmentControl.translatesAutoresizingMaskIntoConstraints = false
//        return segmentControl
//    }()
//    
//    private lazy var textLabel: UILabel = {
//        let textLabel = UILabel()
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        return textLabel
//    }()
//    
//    private lazy var switchLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = appearance.blackColor
//        label.font = .systemFont(ofSize: 17)
//        label.textAlignment = .left
//        label.numberOfLines = 2
//        return label
//    }()
//
//    private lazy var switchView: UISwitch = {
//        let switchView = UISwitch()
//        switchView.translatesAutoresizingMaskIntoConstraints = false
//        switchView.onTintColor = appearance.greenColor
//        switchView.addTarget(self, action: #selector(switchChanged), for: .touchUpInside)
//        return switchView
//    }()
//    
//    // MARK: - Init
//    
//    init(frame: CGRect,
//         delegate: SegmentViewDelegate,
//         appearance: Appearance = Appearance()) {
//        self.delegate = delegate
//        self.appearance = appearance
//        super.init(frame: frame)
//        configureUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// MARK: - private MasterProfileView
//private extension SegmentView {
//    
//    func configureUI() {
//        self.backgroundColor = .clear
//        
//        
//        
//
//        addViews()
//        addConstraints()
//        updateTexts()
//    }
//    
//    func addViews() {
//        [backgroundImage, textLabel,
//         switchLabel, switchView,
//         avatarImage, avatarLabel, segmentControl].forEach({
//            self.addSubview($0)
//        })
//    }
//    
//    func addConstraints() {
//        NSLayoutConstraint.activate([
//            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
//            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backgroundImage.heightAnchor.constraint(equalToConstant: 229),
//            
//            avatarImage.heightAnchor.constraint(equalToConstant: appearance.avatarImageHeight),
//            avatarImage.widthAnchor.constraint(equalToConstant: appearance.avatarImageHeight),
//            avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor),
//            avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
//            
//            avatarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            avatarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            avatarLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -8),
//        
//            segmentControl.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 18),
//            segmentControl.centerXAnchor.constraint(equalTo: centerXAnchor),
//            segmentControl.heightAnchor.constraint(equalToConstant: 32),
//            segmentControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            segmentControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            
//            switchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            switchLabel.trailingAnchor.constraint(equalTo: switchView.leadingAnchor, constant: -16),
//            switchLabel.centerYAnchor.constraint(equalTo: switchView.centerYAnchor),
//            
//            switchView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 28),
//            switchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            switchView.widthAnchor.constraint(equalToConstant: 51),
//            switchView.heightAnchor.constraint(equalToConstant: 31),
//        ])
//    }
//    
//    func updateTexts() {
//        switchLabel.text = "Переключить на профиль мастера"
//    }
//    
//    @objc func switchChanged(mySwitch: UISwitch) {
//        let value = mySwitch.isOn
//        print(value)
//        
//        delegate?.changedSwitchValue()
//    }
//}
