//
//  GalleryView.swift
//  UIGalleryControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol GalleryViewDelegate: AnyObject {
}

final class GalleryView: ProfileBaseView {
    
    // MARK: - Property
    
    weak var delegate: GalleryViewDelegate?
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        button.setImage(UIImage(named: "plusGallery")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 34
        
        return button
    }()
    
    // MARK: - Init
    
    init(frame: CGRect,
         delegate: GalleryViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - private MasterProfileView
private extension GalleryView {
    
    func configureUI() {
        addViews()
        addConstraints()
    }
    
    func addViews() {
        [collectionView, addPhotoButton].forEach({ self.addSubview($0) })
        self.bringSubviewToFront(addPhotoButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addPhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            addPhotoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 68),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 68)
        ])
    }
}
