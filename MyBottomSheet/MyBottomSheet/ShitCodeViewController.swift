//
//  ShitCodeViewController.swift
//  MyBottomSheet
//
//  Created by Krasivo on 23.07.2022.
//

import UIKit
import SnapKit

protocol BottomSheetDelegate: AnyObject {
    func didShowEntireFrontSheet()
    func didHidePartialFrontSheet()
}


class ShitCodeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    enum BottomSheetState {
        case initial
        case moved
    }
    
    // MARK: - Property
    
    var originMargin: CGFloat = 500
    var targetMargin: CGFloat = 400

    private let panGestureRecognizer = UIPanGestureRecognizer()
    weak var BottomSheetDelegate: BottomSheetDelegate?
    
    private var sheetState: BottomSheetState = .initial {
        willSet {
            switch newValue {
            case .initial:
                self.BottomSheetDelegate?.didHidePartialFrontSheet()
            case .moved:
                self.BottomSheetDelegate?.didShowEntireFrontSheet()
            }
        }
    }
    
    private var sheetConstraint: NSLayoutConstraint = NSLayoutConstraint() {
        willSet {
            self.sheetConstraint.isActive = false
        }
        didSet {
            self.sheetConstraint.isActive = true
        }
    }
        
    // MARK: - Views
    
    var box: UIView = {
        let boxLine = UIView()
        boxLine.backgroundColor = .red
        return boxLine
    }()
    
    var bottomSheetView: UIView = {
        let sheet = UIView()
        sheet.backgroundColor = .white
        sheet.layer.cornerRadius = 20
        sheet.layer.borderColor = UIColor.systemGray6.cgColor
        sheet.layer.borderWidth = 2
        sheet.layer.shadowColor = UIColor.black.cgColor
        sheet.layer.shadowOpacity = 0.1
        sheet.layer.shadowRadius = 10
        return sheet
    }()
    
    var scrollRectangleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "scrollRectangle")
        return iv
    }()
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Selectors
    
    @objc
    private func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.bottomSheetView)
        let velocity = sender.velocity(in: self.bottomSheetView)
        let translationY = translation.y
        let yMag = translationY.magnitude
        
        switch sender.state {
        case .began, .changed:
            switch self.sheetState {
            case .initial:
                let newConstant = self.originMargin + yMag
                guard translationY < 0 else {return}
                guard newConstant.magnitude > self.originMargin else {
                    self.showBackgroundSheet(true)
                    return
                }
                self.sheetConstraint.constant = -newConstant
                self.view.layoutIfNeeded()
            case .moved:
                let newConstant = UIScreen.main.bounds.height - yMag
                guard translationY > 0 else {return}
                guard newConstant.magnitude < self.view.frame.height else {
                    self.hideBackgroundSheet(true)
                    return
                }
                self.sheetConstraint.constant = -newConstant
                self.view.layoutIfNeeded()
            }
        case .ended:
            switch self.sheetState {
            case .initial:
                translationY > 0 ? self.showBackgroundSheet(velocity.y.magnitude < 1000) : self.hideBackgroundSheet(velocity.y.magnitude < 1000)
            case .moved:
                translationY <= 0 ? self.hideBackgroundSheet(velocity.y.magnitude < 1000) : self.showBackgroundSheet(velocity.y.magnitude < 1000)
            }
        default:
            break
        }
    }
    
    // MARK: - Configure
    
    private func configure() {
        setupViews()
        setSheetConstraint()
        setupConstraints()
        setupNotificationTarget()
        
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(box)
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(scrollRectangleImageView)
    }
    
    private func setupConstraints() {
        box.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(5)
        }
        
        bottomSheetView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollRectangleImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
    }
    
    private func setupNotificationTarget() {
        self.panGestureRecognizer.delegate = self
        self.panGestureRecognizer.addTarget(self, action: #selector(handlePan))
        bottomSheetView.addGestureRecognizer(self.panGestureRecognizer)
    }
    
    // MARK: - Helpers
    
    private func setSheetConstraint() {
        switch self.sheetState {
        case .initial:
            self.sheetConstraint = self.bottomSheetView.topAnchor.constraint(equalTo: box.bottomAnchor, constant: 20)
        case .moved:
            self.sheetConstraint = self.bottomSheetView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        }
    }
    
    private func showBackgroundSheet(_ animated: Bool) {
        self.sheetConstraint = self.bottomSheetView.topAnchor.constraint(equalTo: box.bottomAnchor, constant: 20)
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.sheetState = .initial
            })
        } else {
            self.view.layoutIfNeeded()
            self.sheetState = .initial
        }
        self.panGestureRecognizer.isEnabled = true
    }
    
    private func hideBackgroundSheet(_ animated: Bool) {
        self.sheetConstraint = self.bottomSheetView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.sheetState = .moved
            })
        } else {
            self.view.layoutIfNeeded()
            self.sheetState = .moved
        }
    }
}
