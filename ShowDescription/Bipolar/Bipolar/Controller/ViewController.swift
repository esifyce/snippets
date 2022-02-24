//
//  ViewController.swift
//  Bipolar
//
//  Created by Sabir Myrzaev on 25.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        if UserDefaults.standard.bool(forKey: "hasViewedWalktrough") {
//            return
//        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            walkthroughViewController.modalPresentationStyle = .fullScreen
            walkthroughViewController.modalTransitionStyle = .crossDissolve
            present(walkthroughViewController, animated: true, completion: nil)
        }
    }
    
}

