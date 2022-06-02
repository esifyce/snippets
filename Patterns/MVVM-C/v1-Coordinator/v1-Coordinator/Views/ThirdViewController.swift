//
//  ThirdViewController.swift
//  v1-Coordinator
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class ThirdViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toSecondVC(_ sender: UIButton) {
        coordinator?.openSecondVC()
    }
    
    @IBAction func toFirstVC(_ sender: UIButton) {
        coordinator?.openFirstVC()
    }
}
