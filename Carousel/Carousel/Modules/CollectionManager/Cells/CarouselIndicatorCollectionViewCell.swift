//
//  CarouselIndicatorCollectionViewCell.swift
//  Carousel
//
//  Created by Krasivo on 19.05.2023.
//

import UIKit

class CarouselIndicatorCollectionViewCell: UICollectionViewCell {
  var bulletView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
  }
  
  private func setupViews() {
    bulletView = UIView()
    
    addSubview(bulletView)
    
    // Set up constraints for bulletView
    bulletView.translatesAutoresizingMaskIntoConstraints = false
    bulletView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    bulletView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    bulletView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    bulletView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    bulletView.layer.cornerRadius = 10
  }
}
