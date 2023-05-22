//
//  CarouselCollectionViewCell.swift
//  Carousel
//
//  Created by Krasivo on 19.05.2023.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
  var numberLabel: UILabel!
  var backgroundCell: UIView!
    
    private lazy var box: UIView = {
       let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .purple
        return box
    }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
  }
  
  private func setupViews() {
    numberLabel = UILabel()
    backgroundCell = UIView()
    
    addSubview(backgroundCell)
    addSubview(numberLabel)
    
    // Set up constraints for backgroundCell
    backgroundCell.translatesAutoresizingMaskIntoConstraints = false
    backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    backgroundCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
    backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    backgroundCell.heightAnchor.constraint(equalToConstant: 330).isActive = true
    
    // Set up constraints for numberLabel
    numberLabel.translatesAutoresizingMaskIntoConstraints = false
    numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
      
      backgroundCell.addSubview(box)
      
      NSLayoutConstraint.activate([
          box.heightAnchor.constraint(equalToConstant: 315),
          box.leadingAnchor.constraint(equalTo: leadingAnchor),
          box.trailingAnchor.constraint(equalTo: trailingAnchor),
          box.centerYAnchor.constraint(equalTo: centerYAnchor),
      //    box.centerYAnchor.constraint(equalTo: centerYAnchor),
      ])
  }
  
  func transformToLarge() {
//    UIView.animate(withDuration: 0.2) {
//      //self.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
//        self.configMiddleImage()
//    }
      self.configMiddleImage()

  }
  
  func transformToStandard() {
      self.configEdgesImage()
//
//    UIView.animate(withDuration: 0.2) {
//        self.configEdgesImage()
//    }
  }
    
    func configMiddleImage() {
        self.box.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
     //   setNeedsLayout()
       // box.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
    func configEdgesImage() {
        self.box.transform = CGAffineTransform.identity
//        backgroundCell.addSubview(box)
//
//        NSLayoutConstraint.activate([
//            box.heightAnchor.constraint(equalToConstant: 100),
//            box.widthAnchor.constraint(equalToConstant: 100),
//            box.centerXAnchor.constraint(equalTo: centerXAnchor),
//            box.centerYAnchor.constraint(equalTo: centerYAnchor),
//        ])
//    //    setNeedsLayout()
//        self.box.transform = CGAffineTransform.identity
    }
}
