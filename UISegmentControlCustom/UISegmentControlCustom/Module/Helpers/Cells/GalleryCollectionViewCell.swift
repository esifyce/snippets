//
//  GalleryCollectionViewCell.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 04.06.2023.
//

import UIKit

extension GalleryCollectionViewCell {
    struct Appearance {
        
    }
}

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let appearance: Appearance
    
    // MARK: - Views
    
    private lazy var galleryImageView: UIImageView = {
        let galleryImage = UIImageView()
        galleryImage.translatesAutoresizingMaskIntoConstraints = false
        galleryImage.backgroundColor = .magenta
        return galleryImage
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        appearance = Appearance()
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel: GalleryViewModel) {
        
    }
}

extension GalleryCollectionViewCell {
    func configureUI() {
        galleryImageView.layer.cornerRadius = 8
        galleryImageView.layer.masksToBounds = false
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(galleryImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: topAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
