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
            make.height.equalTo(5)
            make.width.equalTo(50)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(scrollRectangle.snp.bottom).inset(-20)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(scrollView)
            make.height.equalTo(scrollView.safeAreaLayoutGuide.layoutFrame.height * 1.5)
            make.width.equalTo(scrollView.safeAreaLayoutGuide.layoutFrame.width)
        }
       
        aboutChildView.snp.makeConstraints { make in
            make.top.equalTo(containerView)
            make.leading.right.equalTo(containerView)
        }
        
        adviceChildLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutChildView.snp.bottom).inset(-140)
            make.leading.trailing.equalTo(containerView)
        }
        
        aboutMomView.snp.makeConstraints { make in
            make.top.equalTo(adviceChildLabel.snp.bottom).inset(-30)
            make.leading.trailing.equalTo(containerView)
        }
        
        adviceMomLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutMomView.snp.bottom).inset(-140)
            make.leading.trailing.equalTo(containerView)
        }
        
        aboutFoodView.snp.makeConstraints { make in
            make.top.equalTo(adviceMomLabel.snp.bottom).inset(-30)
            make.leading.trailing.equalTo(containerView)
        }
        
        adviceFoodLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutFoodView.snp.bottom).inset(-140)
            make.leading.trailing.equalTo(containerView)
        }
    }
}

private extension CustomScrollView {
    func createAdviceView(subtitle: String = "", title: String = "", image: String = "") -> AdviceView {
        let view = AdviceView()
        view.fuck(subtitle: subtitle, title: title, image: image)
        return view
    }
}
