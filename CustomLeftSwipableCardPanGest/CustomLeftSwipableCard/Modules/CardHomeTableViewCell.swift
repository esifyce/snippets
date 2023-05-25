//
//  HomeTableViewCell.swift
//  CustomLeftSwipableCard
//
//  Created by Krasivo on 23.05.2023.
//

import UIKit

extension CardHomeTableViewCell {
    struct Appearance {

    }
}

final class CardHomeTableViewCell: UITableViewCell {
    // MARK: - Property
    
    private let appearance: Appearance = Appearance()
    
    // leading and trailing constraints for the container view
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    
    private let origLeading = CGFloat(16.0)
    private let origTrailing = CGFloat(-16.0)
    
    private var currentLeading = CGFloat(0.0)
    private var currentTrailing = CGFloat(0.0)
    
    // MARK: - Views
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.masksToBounds = false
        return cardView
    }()
    
    private lazy var cardTitleLabel: UILabel = {
        let cardTitle = UILabel()
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        cardTitle.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        cardTitle.font = .systemFont(ofSize: 20, weight: .semibold)
        cardTitle.textAlignment = .left
        cardTitle.numberOfLines = 1
        return cardTitle
    }()
    
    private lazy var cardImage: UIImageView = {
        let cardImage = UIImageView()
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.layer.masksToBounds = false
        cardImage.layer.cornerRadius = 8
        return cardImage
    }()
    
    private lazy var avatarUserImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()
    
    private lazy var nameUserLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor(red: 0.367, green: 0.475, blue: 0.389, alpha: 1)
        nameLabel.font = .systemFont(ofSize: 12)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    private lazy var locationImage: UIImageView = {
        let locationImage = UIImageView()
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        return locationImage
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = UIColor(red: 0.367, green: 0.475, blue: 0.389, alpha: 1)
        locationLabel.font = .systemFont(ofSize: 12)
        locationLabel.textAlignment = .left
        locationLabel.numberOfLines = 1
        return locationLabel
    }()
    
    private lazy var practiceImage: UIImageView = {
        let practiceImage = UIImageView()
        practiceImage.translatesAutoresizingMaskIntoConstraints = false
        return practiceImage
    }()
    
    private lazy var practiceLabel: UILabel = {
        let practiceLabel = UILabel()
        practiceLabel.translatesAutoresizingMaskIntoConstraints = false
        practiceLabel.textColor = UIColor(red: 0.367, green: 0.475, blue: 0.389, alpha: 1)
        practiceLabel.font = .systemFont(ofSize: 12)
        practiceLabel.textAlignment = .left
        practiceLabel.numberOfLines = 1
        return practiceLabel
    }()
    
    private lazy var firstServiceLabel: BulletLabel = {
        let service = BulletLabel()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.numberOfLines = 1
        service.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        service.textAlignment = .left
        service.font = .systemFont(ofSize: 14)
        return service
    }()
    
    private lazy var secondServiceLabel: BulletLabel = {
        let service = BulletLabel()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.numberOfLines = 1
        service.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        service.textAlignment = .left
        service.font = .systemFont(ofSize: 14)
        return service
    }()
    
    private lazy var thirdServiceLabel: BulletLabel = {
        let service = BulletLabel()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.numberOfLines = 1
        service.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        service.textAlignment = .left
        service.font = .systemFont(ofSize: 14)
        return service
    }()
    
    private lazy var listServiceStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [firstServiceLabel, secondServiceLabel, thirdServiceLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var mainServiceButton: UIButton = {
        let service = UIButton()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.setImage(UIImage(named: "MainButton"), for: .normal)
        return service
    }()
    
    private lazy var archiveServiceButton: UIButton = {
        let service = UIButton()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.setImage(UIImage(named: "ArchiveButton"), for: .normal)
        return service
    }()
    
    private lazy var removeServiceButton: UIButton = {
        let service = UIButton()
        service.translatesAutoresizingMaskIntoConstraints = false
        service.setImage(UIImage(named: "DeleteButton"), for: .normal)
        return service
    }()
    
    private lazy var listButtonStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [mainServiceButton, archiveServiceButton, removeServiceButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.isHidden = false
        stackView.isHidden = true
        return stackView
    }()
    
    // MARK: - Init
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        listButtonStackView.isHidden = true
        cardView.transform = .identity
    }
    
    // MARK: - Helper
    
    func configureCell(viewModel: CardHomeViewModel) {
        cardImage.image = UIImage(named: viewModel.cardImage)
        cardTitleLabel.text = viewModel.cardTitleLabel
        
        avatarUserImage.image = UIImage(named: viewModel.avatarUserImage)
        nameUserLabel.text = viewModel.nameUserLabel
        
        locationImage.image = UIImage(named: viewModel.locationImage)
        locationLabel.text = viewModel.locationLabel
        
        practiceImage.image = UIImage(named: viewModel.practiceImage)
        practiceLabel.text = viewModel.practiceLabel
        
        firstServiceLabel.text = viewModel.firstService
        secondServiceLabel.text = viewModel.secondServiceLabel
        thirdServiceLabel.text = viewModel.thirdServiceLabel
    }
}
// MARK: - private extension

private extension CardHomeTableViewCell {
    func configureUI() {
        self.backgroundColor = .clear
        
//        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
//        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
//
//        // Настраиваем направления свайпов
//        leftSwipeGesture.direction = .left
//        rightSwipeGesture.direction = .right
//
//        // Добавляем свайп-жесты к ячейке
//        self.contentView.addGestureRecognizer(leftSwipeGesture)
//        self.contentView.addGestureRecognizer(rightSwipeGesture)
        
        let p = UIPanGestureRecognizer(target: self, action: #selector(self.drag(_:)))
            cardView.addGestureRecognizer(p)
        
        
        setViews()
        setConstraints()
    }
    
    func setViews() {
        contentView.addSubview(cardView)
        contentView.addSubview(listButtonStackView)
        [cardTitleLabel, cardImage,
         avatarUserImage, nameUserLabel,
         locationImage, locationLabel,
         practiceImage, practiceLabel,
         listServiceStackView].forEach({ cardView.addSubview($0) })
    }
    
    func setConstraints() {
        
        // containerView leading / trailing constraints - these will be updated as we drag
         leadingConstraint = cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: origLeading)
         trailingConstraint = cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: origTrailing)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            leadingConstraint,
            trailingConstraint,
//            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            listButtonStackView.heightAnchor.constraint(equalToConstant: 148),
            listButtonStackView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            listButtonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            mainServiceButton.heightAnchor.constraint(equalToConstant: 44),
            mainServiceButton.widthAnchor.constraint(equalToConstant: 44),
            
            archiveServiceButton.widthAnchor.constraint(equalToConstant: 44),
            archiveServiceButton.heightAnchor.constraint(equalToConstant: 44),
            
            removeServiceButton.widthAnchor.constraint(equalToConstant: 44),
            removeServiceButton.heightAnchor.constraint(equalToConstant: 44),
            
            cardImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            cardImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            cardImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            cardImage.widthAnchor.constraint(equalToConstant: 125),
            
            cardTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 13),
            cardTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            cardTitleLabel.trailingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: -12),
            
            avatarUserImage.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 4),
            avatarUserImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            
            nameUserLabel.centerYAnchor.constraint(equalTo: avatarUserImage.centerYAnchor),
            nameUserLabel.leadingAnchor.constraint(equalTo: avatarUserImage.trailingAnchor, constant: 2),
            
            locationImage.topAnchor.constraint(equalTo: avatarUserImage.bottomAnchor, constant: 4),
            locationImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 2),
            
            practiceImage.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 4),
            practiceImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            
            practiceLabel.centerYAnchor.constraint(equalTo: practiceImage.centerYAnchor),
            practiceLabel.leadingAnchor.constraint(equalTo: practiceImage.trailingAnchor, constant: 2),
            
            listServiceStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            listServiceStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -13),
            listServiceStackView.trailingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: -12)
            
        ])
    }
}

extension CardHomeTableViewCell {
//    // Обработчик свайп-жестов
//    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
//        if gesture.direction == .left {
//            // Обработка свайпа влево
//            cardView.transform = .init(translationX: -60, y: 0)
//            listButtonStackView.isHidden = false
//        } else if gesture.direction == .right {
//            // Обработка свайпа вправо
//            cardView.transform = .identity
//            listButtonStackView.isHidden = true
//        }
//    }
    
    @objc func drag(_ g: UIPanGestureRecognizer) -> Void {
        
        // when we get a Pan on the container view - a "drag" ...
        guard let sv = g.view?.superview else {
            return
        }
        let translation = g.translation(in: sv)
        
        switch g.state {
        case .began:
            currentLeading = leadingConstraint.constant
            currentTrailing = trailingConstraint.constant
        case .changed:
            // only track left-right dragging
            // don't allow drag-to-the-right
            if currentLeading + translation.x <= origLeading {
                leadingConstraint.constant = currentLeading + translation.x
                trailingConstraint.constant = currentTrailing + translation.x
            }
        default:
            // if the drag-left did not fully reveal the buttons, animate the container view back in place
            if cardView.frame.maxX > listButtonStackView.frame.minX {
                self.leadingConstraint.constant = self.origLeading
                self.trailingConstraint.constant = self.origTrailing
                UIView.animate(withDuration: 0.3, animations: {
                    self.layoutIfNeeded()
                }, completion: { _ in
                    //self.dragX = 0.0
                })
            }
        }
    }
    
}
