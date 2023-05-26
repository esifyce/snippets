//
//  CollectionViewCell.swift
//  CollectionSquare
//
//  Created by Krasivo on 26.05.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private lazy var manikImage: UIImageView = {
        let serviceImage = UIImageView()
        serviceImage.translatesAutoresizingMaskIntoConstraints = false
        serviceImage.image = UIImage(named: "Manik")
        return serviceImage
    }()
    
    private lazy var manikTitle: UILabel = {
       let serviceTitle = UILabel()
        serviceTitle.translatesAutoresizingMaskIntoConstraints = false
        serviceTitle.font = .systemFont(ofSize: 11)
        serviceTitle.textColor = .black
        serviceTitle.numberOfLines = 1
        serviceTitle.textAlignment = .center
        serviceTitle.text = "Стрижка"
        return serviceTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell {
    func configureUI() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        [manikImage, manikTitle].forEach({ contentView.addSubview($0) })
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            manikImage.heightAnchor.constraint(equalToConstant: 46),
            manikImage.widthAnchor.constraint(equalToConstant: 46),
            manikImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            manikImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9.5),
            
            manikTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            manikTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            manikTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -9.5)
        ])
    }
}
