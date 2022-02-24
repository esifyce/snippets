//
//  InstrumentViewCell.swift
//  BipolarTest
//
//  Created by Sabir Myrzaev on 04.07.2021.
//

import UIKit

class InstrumentViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.4196078431, green: 0.3490196078, blue: 0.7490196078, alpha: 1)).withAlphaComponent(0.5)
        selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
