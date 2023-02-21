//
//  NewsDetailCell.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol NewsDetailCellProtocol {
    func cellConfiguration(model: CellTypeProtocol)
}

final class NewsDetailCell: UITableViewCell {
    // MARK: - Property
    fileprivate let imageCache = ImageCache.shared
    var goToLinkTapCallback: (_ url: String) -> (Void)  = {_ in }
    
    // MARK: - Views
    fileprivate var articleImageView: UIImageView = {
        let articleImageView = UIImageView()
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.backgroundColor = .systemBlue
        return articleImageView
    }()
    
    fileprivate var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    fileprivate var descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    fileprivate var publishDateLabel: UILabel = {
        let publishDate = UILabel()
        publishDate.translatesAutoresizingMaskIntoConstraints = false
        return publishDate
    }()
    
    fileprivate var sourceNameLabel: UILabel = {
        let sourceName = UILabel()
        sourceName.translatesAutoresizingMaskIntoConstraints = false
        return sourceName
    }()
    
    var deepLinkLabel: UILabel = {
        let deepLink = UILabel()
        deepLink.translatesAutoresizingMaskIntoConstraints = false
        deepLink.isUserInteractionEnabled = true
        return deepLink
    }()
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.color = .systemGray
            activityIndicator.startAnimating()
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.hidesWhenStopped = true
            return activityIndicator
        }()
    
    fileprivate var imageUrl: URL? {
            didSet {
                articleImageView.image = nil
                activityIndicator.startAnimating()
                guard let url = imageUrl else { return }
                imageCache.image(for: url) { [weak self] image in
                    guard let self else { return }
                    DispatchQueue.main.async {
                        if url == self.imageUrl {
                            self.articleImageView.image = image
                            self.activityIndicator.stopAnimating()
                        }
                    }
                }
            }
        }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - fileprivate NewsDetailCell
fileprivate extension NewsDetailCell {
    func setupUI() {
        addSubviews()
        setConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        deepLinkLabel.addGestureRecognizer(tapGesture)
    }
    
    func addSubviews() {
        [articleImageView, titleLabel, descriptionLabel, publishDateLabel, sourceNameLabel, deepLinkLabel].forEach({
            contentView.addSubview($0)
        })
        articleImageView.addSubview(activityIndicator)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            activityIndicator.centerYAnchor.constraint(equalTo: articleImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: articleImageView.centerXAnchor),
            
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            sourceNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sourceNameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            sourceNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            publishDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publishDateLabel.topAnchor.constraint(equalTo: sourceNameLabel.bottomAnchor, constant: 16),
            publishDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            deepLinkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deepLinkLabel.topAnchor.constraint(equalTo: publishDateLabel.bottomAnchor, constant: 16),
            deepLinkLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
    }
    
    @objc func handleTap() {
        goToLinkTapCallback(deepLinkLabel.text ?? "")
    }

}

// MARK: - NewsMainCellProtocol
extension NewsDetailCell: NewsMainCellProtocol {
    func cellConfiguration(model: CellTypeProtocol) {
        guard
            let title = model.label?.title,
            let image = model.image?.image,
            let imageURL = URL(string: image),
            let description = model.sublabel?.title,
            let publishDate = model.datePublish?.title,
            let sourceName = model.sourcePublsh?.title,
            let deepLink = model.deepLink
        else { return }
        
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.publishDateLabel.text = publishDate
        self.sourceNameLabel.text = sourceName
        self.deepLinkLabel.text = deepLink.title
        self.deepLinkLabel.textColor = deepLink.titleColor
        
        goToLinkTapCallback = deepLink.tapAction ?? {_ in}
        
        self.imageUrl = imageURL
        self.backgroundColor = model.general.cellBackgroundColor
    }
 }
