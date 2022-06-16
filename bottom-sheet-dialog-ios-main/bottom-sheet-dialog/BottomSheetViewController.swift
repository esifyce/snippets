//
//  BottomSheetDialogView.swift
//  bottomsheetdialog-ios
//
//  Created by krasivo on 06/10/21.
//

import UIKit
import SnapKit

open class BottomSheetViewController: UIViewController {
    
    // MARK: - Property
    private let maxDimmedAlpha: CGFloat = 0.8
    private var defaultHeight: CGFloat = UIScreen.main.bounds.height
    private var dismissibleHeight: CGFloat = UIScreen.main.bounds.height - 100
    private let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    private var currentContainerHeight: CGFloat = UIScreen.main.bounds.height
    
    private var isScrollable: Bool = false
    private var containerViewHeightConstraint: NSLayoutConstraint?
    private var containerViewBottomConstraint: NSLayoutConstraint?
    
    // MARK: - Views
    
    var pickBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.4
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupPanGestureHandleClose()
        setupPanGestureInteraction()
        
    }
    
    // MARK: - Configure UI
    
    func setupView() {
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        containerView.addSubview(pickBar)
    }
                
    @objc func handleCloseAction() {
        animateDismissView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    
    @objc func firstButtonActionPressed(sender: UIButton!) {
        animateDismissView()
    }
    
    @objc func secondButtonActionPressed(sender: UIButton!) {
        animateDismissView()
    }
    
    func setupConstraints() {
        
        dimmedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
            self.containerViewHeightConstraint = make.height.greaterThanOrEqualTo(defaultHeight / 2).constraint.layoutConstraints.first
            self.containerViewBottomConstraint = make.bottom.equalTo(defaultHeight).constraint.layoutConstraints.first
        }
        
        pickBar.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(4)
        }
    }
    
    func setupPanGestureHandleClose() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
    }
    
    func setupPanGestureInteraction() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if isScrollable == true {
            let translation = gesture.translation(in: view)
            let isDraggingDown = translation.y > 0
            let newHeight = currentContainerHeight - translation.y
            
            switch gesture.state {
            case .changed:
                if newHeight < maximumContainerHeight {
                    containerViewHeightConstraint?.constant = newHeight
                    view.layoutIfNeeded()
                }
            case .ended:
                if newHeight < dismissibleHeight {
                    self.animateDismissView()
                } else if newHeight < defaultHeight {
                    animateContainerHeight(defaultHeight)
                } else if newHeight < maximumContainerHeight && isDraggingDown {
                    animateContainerHeight(defaultHeight)
                } else if newHeight > defaultHeight && !isDraggingDown {
                    animateContainerHeight(maximumContainerHeight)
                }
            default:
                break
            }
        } else {
            let translation = gesture.translation(in: view)
            let newHeight = currentContainerHeight - translation.y
            
            if gesture.state == .ended {
                if newHeight < dismissibleHeight {
                    self.animateDismissView()
                }
            }
        }
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.6) {
            self.containerViewHeightConstraint?.constant = height
            self.view.layoutIfNeeded()
        }
        currentContainerHeight = height
    }
    
    func animatePresentContainer() {
        UIView.animate(withDuration: 1) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.6) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 1.2) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
        
        UIView.animate(withDuration: 0.6) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
    }
}
