//
//  PhotoTableViewCell.swift
//  TestTableManager
//
//  Created by Krasivo on 18.05.2023.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    // MARK: - Callbacks
    
    var firstPhotoCallback: (() -> Void)?
    var secondPhotoCallback: (() -> Void)?
    var thirdPhotoCallback: (() -> Void)?
    var fourthPhotoCallback: (() -> Void)?
    
    // MARK: - Views
    
    private var titleLabel: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        text.font = .systemFont(ofSize: 17, weight: .regular)
        return text
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    private lazy var firstPhotoButton: UIButton = createButton()
    private lazy var secondPhotoButton: UIButton = createButton()
    private lazy var thirdPhotoButton: UIButton = createButton()
    private lazy var fourthPhotoButton: UIButton = createButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ServiceModel) {
        titleLabel.text = model.titleText
    }
}

private extension PhotoTableViewCell {
    func createButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3).cgColor
        button.backgroundColor = .white
        button.setImage(.init(named: "nophoto"), for: .normal)
        button.tintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 1)
        return button
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        setViews()
        setConstraints()
        addTargets()
    }
    
    func setViews() {
        [titleLabel, stackView].forEach({ contentView.addSubview($0) })
        [firstPhotoButton, secondPhotoButton,
         thirdPhotoButton, fourthPhotoButton].forEach({ stackView.addArrangedSubview($0) })
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            stackView.heightAnchor.constraint(equalToConstant: 116),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            
            firstPhotoButton.heightAnchor.constraint(equalToConstant: 116),
            firstPhotoButton.widthAnchor.constraint(equalToConstant: 80),

            secondPhotoButton.heightAnchor.constraint(equalToConstant: 116),
            secondPhotoButton.widthAnchor.constraint(equalToConstant: 80),

            thirdPhotoButton.heightAnchor.constraint(equalToConstant: 116),
            thirdPhotoButton.widthAnchor.constraint(equalToConstant: 80),

            fourthPhotoButton.heightAnchor.constraint(equalToConstant: 116),
            fourthPhotoButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func addTargets() {
        firstPhotoButton.addTarget(self, action: #selector(didTapFirstAction), for: .touchUpInside)
        secondPhotoButton.addTarget(self, action: #selector(didTapSecondAction), for: .touchUpInside)
        thirdPhotoButton.addTarget(self, action: #selector(didTapThirdAction), for: .touchUpInside)
        fourthPhotoButton.addTarget(self, action: #selector(didTapFourthAction), for: .touchUpInside)
    }
    
    @objc func didTapFirstAction() {
        firstPhotoCallback?()
    }
    
    @objc func didTapSecondAction() {
        secondPhotoCallback?()
    }
    
    @objc func didTapThirdAction() {
        thirdPhotoCallback?()
    }
    
    @objc func didTapFourthAction() {
        fourthPhotoCallback?()
    }
}
