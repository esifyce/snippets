//
//  BlurViewController.swift
//  BlurLabel
//
//  Created by Krasivo on 26.03.2023.
//

import UIKit

class BlurViewController: UIViewController {
    
    // MARK: - Property
    let myText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut"
    let userText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d"
    
    // MARK: - Views
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var separator: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var blurLabel: BlurredLabel = {
        let label = BlurredLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.isUserInteractionEnabled = true
        label.isBlurring = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didBlurTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    // MARK: - Lifecycle VC

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateText()
        blurText(myText.count, text: userText)
    }
    
    @objc
    fileprivate func didBlurTap() {
        blurLabel.isBlurring = false
    }
}

fileprivate extension BlurViewController {
    func setupUI() {
        self.view.backgroundColor = .white
        [firstLabel, separator, blurLabel, secondLabel].forEach({ self.view.addSubview($0) })
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            separator.heightAnchor.constraint(equalToConstant: 2),
            
            secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 16),
            
            blurLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blurLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            blurLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 16),
        ])
    }
    
    func updateText() {
        firstLabel.text = myText
        blurLabel.text = userText
        secondLabel.text = String(userText.prefix(myText.count))
    }
    
    func blurText(_ firstLabelCount: Int, text: String) {
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: firstLabelCount)
        attributedText.addAttribute(.foregroundColor, value: UIColor.clear, range: range)

        blurLabel.attributedText = attributedText
    }
}
