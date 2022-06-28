//
//  NavigationEngine.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/14/21.
//

import UIKit

protocol NavigationEngineProtocol {
    func push(viewController: UIViewController)
    func replace(viewController: UIViewController)

    var context: NavigationEngineContext? { get set }
}

class NavigationEngine: NavigationEngineProtocol {
    let navigationController: UINavigationController
    var context: NavigationEngineContext?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.barTintColor = .lightGray
        self.context = NavigationEngineContext(engine: self)
    }

    func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    func replace(viewController: UIViewController) {
        navigationController.viewControllers = [viewController]
    }
}
