//
//  SecondViewController.swift
//  MVC-C
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        
        

    }

}
