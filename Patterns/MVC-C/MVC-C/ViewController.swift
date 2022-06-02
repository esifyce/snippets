//
//  ViewController.swift
//  MVC-C
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemMint
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Tap Me!", for: .normal)
    }
    
    
    @objc func didTapButton() {
        coordinator?.eventOccured(with: .buttonTapped)
    }


}

