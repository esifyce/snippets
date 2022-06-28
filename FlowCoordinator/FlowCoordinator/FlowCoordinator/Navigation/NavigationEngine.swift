//
//  NavigationEngine.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation
import UIKit

protocol NavigationEngineProtocol {
    var navigationController: UINavigationController { get }
    func push(viewController: UIViewController)
    func replace(viewController: UIViewController)
}

class NavigationEngine: NavigationEngineProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func replace(viewController: UIViewController) {
        navigationController.viewControllers = [viewController]
    }
    
    
}
