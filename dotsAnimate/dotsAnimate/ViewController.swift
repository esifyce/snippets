//
//  ViewController.swift
//  dotsAnimate
//
//  Created by Krasivo on 12.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    let animation = DotsAnimation()
    
    // MARK: - Views
    //
    //    let viewToAnimate: UIView = {
    //       UIView()
    //    }()
    //
    //    var animationDots: UIView = {
    //       UIView()
    //    }()
    //
    let progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.text = "Сохранение"
        progressLabel.textColor = .white
        progressLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return progressLabel
    }()
    
    
    
    // MARK: - Init
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        //        view
        //
        //        let animationDots1 = animation.startDotsAnimation(superView: viewToAnimate, dotsColor: .green)
        //        viewToAnimate.addSubview(animationDots1)
        let viewToAnimate = UIView(frame: CGRect(x: -2, y: 2, width: 24, height: 24))
        viewToAnimate.backgroundColor = UIColor(white: 1, alpha: 0)
        let animation = DotsAnimation()
        let animationDots = animation.startDotsAnimation(superView: viewToAnimate, dotsColor: UIColor.white)
        view.addSubview(viewToAnimate)
        viewToAnimate.backgroundColor = UIColor(red: 104.0/255.0, green: 183.0/255.0, blue: 237.0/255.0, alpha: 1.0)
//        viewToAnimate.addSubview(animationDots)
        
        viewToAnimate.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(135)
            make.height.equalTo(39)
        }
        
        viewToAnimate.layer.cornerRadius = 4
        viewToAnimate.layer.masksToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [progressLabel, animationDots])
        stackView.axis = .horizontal
        stackView.spacing = 0
        
        viewToAnimate.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        // animation.stopDotsAnimation(dots: viewToAnimate)
    }
    
    // MARK: - Selectors
    
    // MARK: - Configure
    
    private func configure() {
        setupViews()
        setupConstraints()
        
        //  viewToAnimate.addSubview(animationDots)
        
        view.backgroundColor = .white
        // viewToAnimate.backgroundColor = .blue
    }
    
    private func setupViews() {
        //     view.addSubview(viewToAnimate)
    }
    
    private func setupConstraints() {
        //        viewToAnimate.snp.makeConstraints { make in
        //            make.height.equalTo(UIScreen.main.bounds.width * 125 / 812.0)
        //            make.width.equalTo(UIScreen.main.bounds.height * 39 / 375)
        //            make.center.equalToSuperview()
        //        }
        //
        //        var animationDots1 = animation.startDotsAnimation(superView: viewToAnimate, dotsColor: UIColor.red)
        //
        
    }
}

