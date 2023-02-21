//
//  NewsMainCell.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol NewsMainCellProtocol {
    func cellConfiguration(model: CellTypeProtocol)
}

final class NewsMainCell: UITableViewCell {
    
    // MARK: - Property
    fileprivate let imageCache = ImageCache.shared
    
    // MARK: - Views
    fileprivate var squareImageView: UIImageView = {
        let squareIV = UIImageView()
        squareIV.translatesAutoresizingMaskIntoConstraints = false
        squareIV.backgroundColor = .systemBlue
        return squareIV
    }()
    
    fileprivate var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    fileprivate var eyeCountLabel: UILabel = {
        let eyeCountLabel = UILabel()
        eyeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return eyeCountLabel
    }()
    
    fileprivate var eyeImageView: UIImageView = {
        let eyeImageView = UIImageView()
        eyeImageView.image = UIImage(systemName: "eye")?.withTintColor(.black)
        eyeImageView.translatesAutoresizingMaskIntoConstraints = false
        return eyeImageView
    }()
    
    fileprivate var goToDetailImageView: UIImageView = {
        let goToDetailImageView = UIImageView()
        goToDetailImageView.image = UIImage(systemName: "chevron.compact.right")
        goToDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        return goToDetailImageView
    }()
    
    fileprivate lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var imageUrl: URL? {
            didSet {
                squareImageView.image = nil
                activityIndicator.startAnimating()
                guard let url = imageUrl else { return }
                imageCache.image(for: url) { [weak self] image in
                    guard let self else { return }
                    DispatchQueue.main.async {
                        if url == self.imageUrl {
                            self.squareImageView.image = image
                            self.activityIndicator.stopAnimating()
                        }
                    }
                }
            }
        }
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.color = .systemGray
            activityIndicator.startAnimating()
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.hidesWhenStopped = true
            return activityIndicator
        }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - NewsMainCellProtocol
extension NewsMainCell: NewsMainCellProtocol {
    func cellConfiguration(model: CellTypeProtocol) {
        guard
            let titleText = model.label?.title,
            let eyeText = model.sublabel?.title,
            let image = model.image?.image,
            let imageURL = URL(string: image),
            let separatorStyle = model.separator else { return }
        self.titleLabel.text = titleText
        self.eyeCountLabel.text = eyeText
        separator.isHidden = separatorStyle.isHidden
        separator.backgroundColor = separatorStyle.backgroundColor.withAlphaComponent(separatorStyle.backgroundColorAlfa)
        imageUrl = imageURL
        self.backgroundColor = model.general.cellBackgroundColor
    }
 }

fileprivate extension NewsMainCell {
    func setupUI() {
        
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        [squareImageView, titleLabel, eyeCountLabel, eyeImageView, goToDetailImageView, separator].forEach({
            contentView.addSubview($0)
        })
        squareImageView.addSubview(activityIndicator)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            activityIndicator.centerYAnchor.constraint(equalTo: squareImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: squareImageView.centerXAnchor),
            
            squareImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            squareImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            squareImageView.heightAnchor.constraint(equalToConstant: 60),
            squareImageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: squareImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: goToDetailImageView.leadingAnchor, constant: -16),
            
            eyeCountLabel.leadingAnchor.constraint(equalTo: squareImageView.trailingAnchor, constant: 8),
            eyeCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            eyeImageView.leadingAnchor.constraint(equalTo: eyeCountLabel.trailingAnchor, constant: 8),
            eyeImageView.centerYAnchor.constraint(equalTo: eyeCountLabel.centerYAnchor),
            
            goToDetailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            goToDetailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goToDetailImageView.heightAnchor.constraint(equalToConstant: 30),
            goToDetailImageView.widthAnchor.constraint(equalToConstant: 15),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
}
