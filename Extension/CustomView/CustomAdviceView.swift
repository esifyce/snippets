//
//  CustomAdviceView.swift
//  MedTech
//
//  Created by Krasivo on 07.06.2022.
//

import UIKit
import SnapKit

class AdviceView: UIView {
    
    // MARK: - Views
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Style.borderLineColor
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private var categorySubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Style.grayColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private var aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Style.blackColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private var adviceImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure View
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        backgroundColor = .clear
    }
    
    private func setupSubviews() {
        self.addSubview(contentView)
        contentView.addSubview(adviceImageView)
        contentView.addSubview(categorySubtitleLabel)
        contentView.addSubview(aboutTitleLabel)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.height.equalTo(computedHeight(120))
            make.edges.equalToSuperview()
        }
        
        adviceImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.height.equalTo(120)
        }
        
        categorySubtitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(adviceImageView.snp.leading).offset(15)
        }
        
        aboutTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(adviceImageView.snp.leading).inset(-15)
            make.centerY.equalToSuperview()
        }
    }
    
    func fuck(subtitle: String, title: String, image: String) {
        categorySubtitleLabel.text = subtitle
        aboutTitleLabel.text = title
        adviceImageView.image = UIImage(named: image)
    }
}
