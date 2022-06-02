//
//  ViewController.swift
//  v1-Coordinator
//
//  Created by Krasivo on 01.06.2022.
//

import UIKit

class FirstViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func toSecondVC(_ sender: UIButton) {
        coordinator?.openSecondVC()
    }
    
    @IBAction func toFirstVC(_ sender: UIButton) {
        coordinator?.openFirstVC()
    }
    
}

