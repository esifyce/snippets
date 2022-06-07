//
//  CustomScrollView.swift
//  MedTech
//
//  Created by Krasivo on 07.06.2022.
//

import UIKit
import SnapKit

class CustomScrollView: UIView {
    
    // MARK: - Property
    
    private lazy var aboutChildView: AdviceView = createAdviceView(
        subtitle: "Новости для вашего ребенка!",
        title: "Все о беременности и родах",
        image: "childAdvice"
    )
    
    private lazy var aboutMomView: AdviceView = createAdviceView(
        subtitle: "Советы по здоровью!",
        title: "Как следить за здоровьем мамы",
        image: "pregnancyWomanAdvice"
    )
    
    private lazy var aboutFoodView: AdviceView = createAdviceView(
        subtitle: "Правильное питание",
        title: "Чем нужно питаться беременным?",
        image: "fruitsAdvice"
    )
    
    // MARK: - Views
    
    let scrollRectangle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scrollRectangle")
        return imageView
    }()
    
    private var adviceChildLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Style.blackColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Итак, тест показал две полоски, и вы задаетесь вопросом: что делать дальше? На сайтах для беременных и будущих мам представлено множество информации, но она противоречива и не всегда понятна. Мы расскажем вам о том, что нужно знать — только самое важное. Всю правду обо всех аспектах беременности и родов, а также полезные советы для будущих мам вы найдете в других статьях на нашем сайте."
        return label
    }()
    
    private var adviceMomLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Style.blackColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Наблюдаться у гинеколога. Встать на учет следует сразу, как только вы увидели две полоски на тесте. Первый триместр — он самый важный. От его течения во многом зависит, как будет развиваться беременность. Рекомендуется вовремя проходить все обследования — сдавать анализы, делать УЗИ. Это поможет узнать все про беременность, вовремя заметить изменения и если будет нужно — оказать помощь."
        return label
    }()
    
    private var adviceFoodLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Style.blackColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Наблюдаться у гинеколога. Встать на учет следует сразу, как только вы увидели две полоски на тесте. Первый триместр — он самый важный. От его течения во многом зависит, как будет развиваться беременность. Рекомендуется вовремя проходить все обследования — сдавать анализы, делать УЗИ. Это поможет узнать все про беременность, вовремя заметить изменения и если будет нужно — оказать помощь."
        return label
    }()
    
    
    // MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = UIColor.clear
        scroll.frame = bounds
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
        setupConstraints()
    }
    
    // MARK: - Configure View
    
    private func configureUI() {
        
        addSubview(scrollView)
        addSubview(scrollRectangle)
        scrollView.addSubview(containerView)
        
        containerView.addSubviews(aboutChildView, adviceChildLabel, aboutMomView, adviceMomLabel, aboutFoodView, adviceFoodLabel)
    }
    
    private func setupConstraints() {
        
        scrollRectangle.snp.makeConstraints { make in
            make.height.equalTo(computedHeight(5))
            make.width.equalTo(computedWeight(50))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(5)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(scrollView.safeAreaLayoutGuide.layoutFrame.height * 1.5)
            make.width.equalToSuperview()
        }
       
        aboutChildView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        adviceChildLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutChildView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        aboutMomView.snp.makeConstraints { make in
            make.top.equalTo(adviceChildLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        adviceMomLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutMomView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        aboutFoodView.snp.makeConstraints { make in
            make.top.equalTo(adviceMomLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        adviceFoodLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutFoodView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
    }
}

private extension CustomScrollView {
    func createAdviceView(subtitle: String = "", title: String = "", image: String = "") -> AdviceView {
        let view = AdviceView()
        view.fillOutView(subtitle: subtitle, title: title, image: image)
        return view
    }
}
