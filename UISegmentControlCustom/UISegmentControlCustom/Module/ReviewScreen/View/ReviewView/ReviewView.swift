//
//  ReviewView.swift
//  UIReviewControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol ReviewViewDelegate: AnyObject {
}

final class ReviewView: ProfileBaseView {
    
    // MARK: - Property
    
    weak var delegate: ReviewViewDelegate?
    
    // MARK: - Init
    
    init(frame: CGRect,
         delegate: ReviewViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - private MasterProfileView
private extension ReviewView {
    
    func configureUI() {
        self.backgroundColor = .clear
        
        addViews()
        addConstraints()
    }
    
    func addViews() {
        [].forEach({
            self.addSubview($0)
        })
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
     
        ])
    }
}
