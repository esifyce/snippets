//
//  ViewController.swift
//  withoutStoryboard8
//
//  Created by Sabir Myrzaev on 3/3/22.
//

import UIKit

class ViewController: UIViewController {

    let background = UIImageView(image: #imageLiteral(resourceName: "1"))

    let labelText = UILabel(text: "Начало игры. И раздача начальных 12 карт по 3 совподающих карты")
    
    
    let buttonOne = UIButton(title: "Hello", backgroundColor: .blue, titleColor: .red, isShadow: true)
    
    let buttonTwo = UIButton(title: "Good Bye", backgroundColor: .blue, titleColor: .red, isShadow: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.textColor = .blue
        view.backgroundColor = .gray
        setupConstraints()

    }
    
    private func setupConstraints() {
        //настройки фона
        background.translatesAutoresizingMaskIntoConstraints = false    //свойство подключает маску
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.heightAnchor.constraint(equalToConstant: 900),           // картинка высотой 900
            background.widthAnchor.constraint(equalToConstant: 415),            // ширина картикин
            background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),  //крепим к верху с отступом 0
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor)    //привязка в центру
        ])
        //настройки текста
        labelText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelText)
        
        NSLayoutConstraint.activate([                               //включает constreint
            labelText.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            labelText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelText.heightAnchor.constraint(equalToConstant: 500),
            labelText.widthAnchor.constraint(equalToConstant: 350)
        ])
        labelText.numberOfLines = 0
        labelText.textAlignment = .justified
        
        
        _ = StackButton(button: buttonOne)
        _ = StackButton(button: buttonTwo)
        //настройки кнопок
        let stackButtonView = UIStackView(arrangedSubviews: [buttonOne, buttonTwo])
        
        
        
        stackButtonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackButtonView)
        stackButtonView.axis = .vertical
        stackButtonView.spacing = 20
        
        
        stackButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -40).isActive = true
        stackButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        //stackButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40).isActive = true
        stackButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}






import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)  //заполнить все
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ViewController()
        
        func makeUIViewController(context: Context) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
