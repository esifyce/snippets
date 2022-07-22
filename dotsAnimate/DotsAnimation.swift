//
//  DotsAnimation.swift
//  dotsAnimate
//
//  Created by Krasivo on 12.07.2022.
//

import UIKit
import SnapKit

class ProgressDotsHud: UIView {
    static let shared = ProgressDotsHud()
    
    // MARK: - Property
    
    let animation = DotsAnimation()
    
    // MARK: - Init
    
    private override init(frame: CGRect) {
        super.init(frame: CGRect(origin: CGPoint(x: frame.size.width / 2,
                                                 y: frame.size.height / 2), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        configureUI()
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    // MARK: - Configure
    
    private func configureUI() {
        let viewToAnimate = UIView(frame: CGRect(x: -2, y: 2, width: 24, height: 24))
        let animation = DotsAnimation()
        let progressLabel = UILabel()
        let animationDots = animation.startDotsAnimation(superView: viewToAnimate, dotsColor: UIColor.white)
        
        progressLabel.text = "Сохранение"
        progressLabel.textColor = .white
        progressLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        viewToAnimate.backgroundColor = UIColor(red: 104.0/255.0, green: 183.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        viewToAnimate.layer.cornerRadius = 4
        viewToAnimate.layer.masksToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [progressLabel, animationDots])
        stackView.axis = .horizontal
        stackView.spacing = 0
        
        setSubviews(viewToAnimate, stackView)
        setConstraints(viewToAnimate, stackView)
    }
    
    private func setSubviews(_ view: UIView, _ stack: UIStackView) {
        addSubview(view)
        view.addSubview(stack)
    }
    
    private func setConstraints(_ view: UIView, _ stack: UIStackView) {
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(135)
            make.height.equalTo(39)
        }
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}

class DotsAnimation {
    
    func startHud(dots: UIView?) {
        if dots != nil {
            for subview in (dots?.subviews)! {
                subview.isHidden = false
            }
            dots?.isHidden = false
        }
    }
    
    func stopHud(dots: UIView?) {
        if dots != nil {
            for subview in (dots?.subviews)! {
                subview.isHidden = true
            }
            dots?.isHidden = true
        }
    }
    
    func stopDotsAnimation(dots:UIView?) {
        if dots != nil {
            for subview in (dots?.subviews)! {
                subview.removeFromSuperview()
            }
            dots?.removeFromSuperview()
        }
    }
    
    func startDotsAnimation(superView:UIView, dotsColor:UIColor) -> UIView {
        let dots = self.buildView(superView: superView, dotsColor: dotsColor)
        
        animateWithKeyframes(dotToAnimate: dots.subviews[0], delay: 0.0)
        animateWithKeyframes(dotToAnimate: dots.subviews[1], delay: 0.3)
        animateWithKeyframes(dotToAnimate: dots.subviews[2], delay: 0.6)
        return dots
    }
    
    private func buildView(superView:UIView, dotsColor:UIColor) -> UIView {
        let dots = UIView(frame: superView.frame)
        
        dots.backgroundColor = UIColor(white: 1, alpha: 0)
        
        let numberDots = CGFloat(3)
        
        let width = CGFloat(dots.frame.width/8)
        let dotDiameter = (dots.frame.height < width) ? dots.frame.height : width
        var frame = CGRect(x: (dots.frame.origin.x + width), y: (dots.frame.origin.y + (dots.frame.height/2) - (dotDiameter/2)), width: dotDiameter, height: dotDiameter)
        let cornerRadiusLocal = dotDiameter / 2
        
        for _ in 0...Int(numberDots-1) {
            let dot:UIView = UIView(frame:frame)
            dot.layer.cornerRadius = cornerRadiusLocal;
            dot.backgroundColor = dotsColor
            dots.addSubview(dot)
            frame.origin.x += (1.6 * dotDiameter)
        }
        return dots
    }
    
    private func animateWithKeyframes(dotToAnimate:UIView, delay:Double) {
        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: delay,
            options: [UIView.KeyframeAnimationOptions.repeat],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.33333333333,
                    animations: {
                        dotToAnimate.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.33333333333,
                    relativeDuration: 0.66666666667,
                    animations: {
                        dotToAnimate.transform = CGAffineTransform.identity
                    }
                )
            }
        )
    }
}
