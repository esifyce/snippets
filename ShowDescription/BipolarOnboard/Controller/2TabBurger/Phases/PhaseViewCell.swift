//
//  PhaseViewCell.swift
//  BipolarTest
//
//  Created by Sabir Myrzaev on 06.07.2021.
//

import UIKit

class PhaseViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3529411765, green: 0.8196078431, blue: 0.8352941176, alpha: 1)).withAlphaComponent(0.5)
        selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
