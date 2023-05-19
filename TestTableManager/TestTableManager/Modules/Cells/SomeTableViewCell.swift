//
//  SomeTableViewCell.swift
//  TestTableManager
//
//  Created by Krasivo on 17.05.2023.
//

import UIKit

class SomeTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        text.font = .systemFont(ofSize: 17, weight: .regular)
        return text
    }()
    
    private var categoryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
        return view
    }()
    
    private var categoryLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        text.font = .systemFont(ofSize: 17, weight: .regular)
        return text
    }()
    
    private var categotyImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ServiceModel) {
        titleLabel.text = model.titleText
        categoryLabel.text = model.serviceText
        categotyImageView.image = UIImage(named: "right")
    }

}

private extension SomeTableViewCell {
    func configureUI() {
        self.backgroundColor = .clear
        setViews()
        setConstraints()
    }
    
    func setViews() {
        [titleLabel, categoryView].forEach({ contentView.addSubview($0) })
        [categoryLabel, categotyImageView].forEach({ categoryView.addSubview($0) })
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            categoryView.heightAnchor.constraint(equalToConstant: 44),
            
            titleLabel.bottomAnchor.constraint(equalTo: categoryView.topAnchor, constant: -2),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            categotyImageView.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor),
            categotyImageView.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -16),
            categotyImageView.heightAnchor.constraint(equalToConstant: 14),
            categotyImageView.widthAnchor.constraint(equalToConstant: 13),
            
            categoryLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 16),
            categoryLabel.topAnchor.constraint(equalTo: categoryView.topAnchor, constant: 11),
            categoryLabel.trailingAnchor.constraint(equalTo: categotyImageView.leadingAnchor, constant: 8)
            
        ])
    }
}
