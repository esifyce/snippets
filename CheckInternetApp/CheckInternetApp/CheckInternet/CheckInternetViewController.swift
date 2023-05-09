//
//  CheckInternetViewController.swift
//  CheckInternetApp
//
//  Created by Krasivo on 08.05.2023.
//

import UIKit

class CheckInternetViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var firstButton: UIButton = {
        makeButton(title: "First")
    }()
    
    private lazy var secondButton: UIButton = {
        makeButton(title: "Second")
    }()
    
    private lazy var thirdButton: UIButton = {
        makeButton(title: "Third")
    }()
    
    // MARK: - Lifecycle VC

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
       
       func showWithoutEnternetAlert(methodHandler: (() -> Void)?) {
           let alertAction = UIAlertController(title: "Отсутствует интернет!", message: "У вас нет интернета, проверьте подключение.", preferredStyle: .alert)
           
           let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
           let repeatAction = UIAlertAction(title: "Повторить", style: .default) { (action) in
               methodHandler?()
           }
           
           alertAction.addAction(repeatAction)
           alertAction.addAction(cancelAction)
       
           self.present(alertAction, animated: true, completion: nil)
       }
}

// MARK: - private extension CheckInternetViewController
private extension CheckInternetViewController {
    func setupUI() {
        self.view.backgroundColor = .gray
        title = "MAIN"
        
        addViews()
        addConstraints()
        addTargets()
    }
    
    func addViews() {
        [firstButton, secondButton, thirdButton].forEach({ view.addSubview($0) })
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: -80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 60),
            
            secondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 60),
            
            thirdButton.bottomAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 80),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.widthAnchor.constraint(equalToConstant: 100),
            thirdButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func addTargets() {
      //  firstButton.addTarget(self, action: #selector(didTapFirstBtn), for: .touchUpInside)
//        secondButton.addTarget(self, action: #selector(didTapSecondBtn), for: .touchUpInside)
//        thirdButton.addTarget(self, action: #selector(didTapThirdBtn), for: .touchUpInside)
        
//        firstButton.addAction(UIAction { [weak self] Action in
//            self?.checkNetworkIsOn { [weak self] in
//                self?.pushNewVC(title: "First")
//            }
//        }, for: .touchUpInside)
        
        
        firstButton.addAction {
            print("NICE")
        }
      
        secondButton.addActionWithConnection {
            print("Connected")
        }
        
        thirdButton.addActionWithConnection { [weak self] in
            self?.pushNewVC(title: "CONNECTED")
        }
    }

    func makeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }
    
    func pushNewVC(title: String) {
        let vc = UIViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.view.backgroundColor = .green
        vc.title = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Selectors
    
    @objc
    func didTapFirstBtn(sender: UIButton) {
        pushNewVC(title: "First")
    }
    
    @objc
    func didTapSecondBtn(sender: UIButton) {
        checkNetworkIsOn { [weak self] in
            let vc = UIViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.view.backgroundColor = .orange
            vc.title = "ДВА"
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc
    func didTapThirdBtn(sender: UIButton) {
        checkNetworkIsOn { [weak self] in
            let vc = UIViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.view.backgroundColor = .cyan
            vc.title = "ТРИ"
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
