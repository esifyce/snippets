//
//  MainCoordinator.swift
//  MVC-C
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = SecondViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
