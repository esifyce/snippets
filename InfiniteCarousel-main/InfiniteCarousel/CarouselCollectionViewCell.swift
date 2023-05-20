//
//  CarouselCollectionViewCell.swift
//  InfiniteCarousel
//
//  Created by Krasivo on 19.05.2023.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var backgroundCell: UIView!
  
  func transformToLarge(){
    UIView.animate(withDuration: 0.2){
      self.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
    }
  }
  
  func transformToStandard(){
    UIView.animate(withDuration: 0.2){
      self.transform = CGAffineTransform.identity
    }
  }
}
