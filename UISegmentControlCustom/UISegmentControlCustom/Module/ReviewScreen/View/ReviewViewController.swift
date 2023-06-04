//
//  ReviewViewController.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol ReviewViewControllerProtocol: AnyObject {
    
}

class ReviewViewController: UIViewController {
    
    // MARK: - Properrt
    
    private var tapSegment: ((UISegmentedControl) -> Void)
    private let presenter: ReviewPresenterProtocol?
    
    // MARK: - Views
    
    private lazy var reviewView = ReviewView(frame: UIScreen.main.bounds, delegate: presenter as! ReviewViewDelegate)

    // MARK: - Lifecycle VC

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reviewView.selectedSegment(index: 2)
    }

    
    init(presenter: ReviewPresenterProtocol?, tapSegment: (@escaping (UISegmentedControl) -> Void)) {
        self.tapSegment = tapSegment
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ReviewViewController {
    func configureUI() {
        view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
        
        addViews()
        addTargets()
        addConstraints()
        updateTexts()
    }
    
    func addViews() {
        [reviewView].forEach({
            self.view.addSubview($0)
        })
    }
    
    func addConstraints() {
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addTargets() {
        reviewView.segmentedControl.addTarget(self, action: #selector(didTapSegment), for: .valueChanged)
    }
    
    func updateTexts() {}

    @objc func didTapSegment(segment: UISegmentedControl) {
        tapSegment(segment)
    }
    
}
