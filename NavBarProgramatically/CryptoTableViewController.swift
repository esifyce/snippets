//
//  CryptoTableViewController.swift
//  HardUIComponents
//
//  Created by Sabir Myrzaev on 09.02.2022.
//

import UIKit

class CryptoTableViewController: UIViewController, UINavigationBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navBar = UINavigationBar()
        
        
        if UIScreen.main.bounds.size.height > 750 {
            navBar  = UINavigationBar(frame: CGRect(x: 0, y: 43, width: view.frame.size.width, height: 44))
        }
        else{
            navBar  = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: 44))
        }
        
        view.addSubview(navBar)
        
        navBar.delegate = self
        let navItem = UINavigationItem(title: "Портфолио")
        let settingItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector(selectorName))
        navItem.rightBarButtonItem = settingItem
        
        navBar.setItems([navItem], animated: false)
        
        navBar.prefersLargeTitles = true
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    @objc func selectorName() {
        
    }
}
