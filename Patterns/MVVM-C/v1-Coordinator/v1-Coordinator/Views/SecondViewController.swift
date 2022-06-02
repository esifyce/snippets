//
//  SecondViewController.swift
//  v1-Coordinator
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class SecondViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func toThirdVC(_ sender: UIButton) {
        coordinator?.openThirdVC()
    }
    @IBAction func toFirstVC(_ sender: UIButton) {
        coordinator?.openFirstVC()
    }
    
}
