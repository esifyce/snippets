//
//  AboutViewController.swift
//  UIAboutControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol AboutViewControllerProtocol: AnyObject {
    
}

final class AboutViewController: UIViewController {
    
    // MARK: - Property
    
    private let presenter: AboutPresenterProtocol?
    private lazy var aboutView = AboutView(frame: UIScreen.main.bounds, delegate: presenter as! AboutViewDelegate)
    private var tapSegment: ((UISegmentedControl) -> Void)
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        aboutView.segmentedControl.selectedSegmentIndex = 0
    }
    
    init(presenter: AboutPresenterProtocol?, tapSegment: @escaping ((UISegmentedControl) -> Void)) {
        self.presenter = presenter
        self.tapSegment = tapSegment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.presenter = nil
        self.tapSegment = { _ in }
        super.init(coder: coder)
    }
    
}

private extension AboutViewController {
    func configureUI() {
        view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
        view.addSubview(aboutView)
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalTo: self.view.topAnchor),
            aboutView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            aboutView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            aboutView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        aboutView.segmentedControl.addTarget(self, action: #selector(didTapSegment), for: .valueChanged)
    }
    
    @objc func didTapSegment(segmentControl: UISegmentedControl) {
        tapSegment(segmentControl)
    }
}

extension AboutViewController: AboutViewControllerProtocol {
    
}

