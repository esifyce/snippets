//
//  LabelCell.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol LabelCellProtocol {
    func cellConfiguration(model: CellTypeProtocol)
}

class LabelCell: UITableViewCell {
        
    // MARK: - Property
    var actionForRow: Bool = false
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    
    // MARK: - Views
    fileprivate lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.preferredMaxLayoutWidth = frame.width
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - fileprivate LabelCell
fileprivate extension LabelCell {
    func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)
    }
    
    func makeConstraints() {
        leadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
        trailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        
        guard let titleLabelLeadingConstraint = leadingConstraint,
              let titleLabelTrailingConstraint = trailingConstraint else { return }
       
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabelLeadingConstraint,
            titleLabelTrailingConstraint,
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        
    }
}

// MARK: - LabelCellProtocol
extension LabelCell: LabelCellProtocol {
    func cellConfiguration(model: CellTypeProtocol) {
       
        guard let label = model.label,
              let separatorStyle = model.separator else { return }
      
        titleLabel.text = label.title
        titleLabel.textColor = label.titleColor
        titleLabel.font = label.titleFont
        titleLabel.numberOfLines = label.numberOfLines
        titleLabel.textAlignment = label.textAlignment
        
        separator.isHidden = separatorStyle.isHidden
        separator.backgroundColor = separatorStyle.backgroundColor.withAlphaComponent(separatorStyle.backgroundColorAlfa)
        
        leadingConstraint?.constant = label.leadingConstraint ?? 0
        trailingConstraint?.constant = label.trailingConstraint ?? 0
        self.backgroundColor = model.general.cellBackgroundColor
        
    }
 }
