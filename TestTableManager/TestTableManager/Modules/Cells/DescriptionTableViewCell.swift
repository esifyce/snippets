//
//  DescriptionTableViewCell.swift
//  TestTableManager
//
//  Created by Krasivo on 17.05.2023.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    // MARK: - Property
    var textChanged: ((String) -> Void)?

    // MARK: - Views
    
    private var titleLabel: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor(red: 0.118, green: 0.114, blue: 0.184, alpha: 1)
        text.font = .systemFont(ofSize: 17, weight: .regular)
        return text
    }()
    
    private var descriptionTextView: UITextView = {
       let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.backgroundColor = .white
        description.layer.cornerRadius = 10
        description.layer.borderWidth = 1
        description.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
        description.autocorrectionType = .no
        description.font = .systemFont(ofSize: 17)
        description.tintColor = UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1)
        description.textContainerInset = .init(top: 11, left: 16, bottom: 11, right: 16)
        return description
    }()
    
    private var limitMessageLabel: UILabel = {
        let text = UILabel()
         text.translatesAutoresizingMaskIntoConstraints = false
         text.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
         text.font = .systemFont(ofSize: 13, weight: .regular)
         return text
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
        descriptionTextView.text = model.serviceText
        limitMessageLabel.text = "Нужно ввести от 20 до 500 символов"
    }

}

private extension DescriptionTableViewCell {
    func configureUI() {
        self.backgroundColor = .clear
        descriptionTextView.delegate = self
        
        setViews()
        setConstraints()
    }
    
    func setViews() {
        [titleLabel, descriptionTextView, limitMessageLabel].forEach({ contentView.addSubview($0) })
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(equalTo: limitMessageLabel.topAnchor, constant: -4),
            
            limitMessageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            limitMessageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            limitMessageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func textChanged(action: @escaping (String) -> Void) {
         self.textChanged = action
     }
}

extension DescriptionTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textChanged?(textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor(red: 0.601, green: 0.713, blue: 0.624, alpha: 1).cgColor
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Получите текущий текст в UITextView
        guard let currentText = textView.text else {
            return true
        }
        
        // Проверьте, что общая длина текста после ввода не превышает 500 символов
        let newText = (currentText as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 500
    }
    
}
