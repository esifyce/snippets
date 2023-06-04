//
//  SegmentViewController.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol SegmentViewControllerProtocol: AnyObject {
    
}

final class SegmentViewController: UIViewController {
    
    // MARK: - Property
    
    private let presenter: SegmentPresenterProtocol?
    private lazy var tapSegmentCallback: (UISegmentedControl) -> Void = { [weak self] segmentControl in
        self?.didTapSegment(segment: segmentControl)
    }
    lazy var aboutVC = AboutAssembly.assembly(tapSegment: tapSegmentCallback)
    lazy var galleryVC = GalleryAssembly.assembly(tapSegment: tapSegmentCallback)
    lazy var reviewsVC = ReviewAssembly.assembly(tapSegment: tapSegmentCallback)
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.viewDidLoad()
        
        [aboutVC, galleryVC, reviewsVC].forEach({ controller in
            addChild(controller)
            view.addSubview(controller.view)
            controller.didMove(toParent: self)
            controller.view.frame = self.view.bounds
        })
        aboutVC.view.isHidden = false
        galleryVC.view.isHidden = true
        reviewsVC.view.isHidden = true
        
        tapSegmentCallback = { [weak self] segmentControl in
            self?.didTapSegment(segment: segmentControl)
            print(segmentControl.selectedSegmentIndex)
        }
    }
    
    init(presenter: SegmentPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.presenter = nil
        super.init(coder: coder)
    }
    
}

private extension SegmentViewController {
    func configureUI() {
        title = "Профиль"
        view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
    }
    
    @objc
    func didTapSegment(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case .zero:
            aboutVC.viewWillAppear(false)
            manageChildVC(shouldHideAbout: false)
        case 1:
            galleryVC.viewWillAppear(false)
            manageChildVC(shouldHideGallery: false)
        default:
            self.reviewsVC.viewWillAppear(false)
            manageChildVC(shouldHideReviews: false)
        }
    }
    
    func manageChildVC(shouldHideAbout: Bool = true, shouldHideGallery: Bool = true, shouldHideReviews: Bool = true) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.aboutVC.view.isHidden = shouldHideAbout
            self.galleryVC.view.isHidden = shouldHideGallery
            self.reviewsVC.view.isHidden = shouldHideReviews
        }
    }
}

extension SegmentViewController: SegmentViewControllerProtocol {}

