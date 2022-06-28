//
//  NavigationEngine.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
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
