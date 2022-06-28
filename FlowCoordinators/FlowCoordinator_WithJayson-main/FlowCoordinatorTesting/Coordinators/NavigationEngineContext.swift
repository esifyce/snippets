//
//  NavigationEngineContext.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 1/31/22.
//

import Foundation
import UIKit

protocol NavigationEngineContextProtocol {
    func push(viewController: UIViewController)

    func replace(viewController: UIViewController)

    func setNavBarColor(color: UIColor)
}

class NavigationEngineContext: NavigationEngineContextProtocol {
    let navigationEngine: NavigationEngine

    init(engine: NavigationEngine) {
        navigationEngine = engine
    }

    func push(viewController: UIViewController) {
        navigationEngine.push(viewController: viewController)
    }

    func replace(viewController: UIViewController) {
        navigationEngine.replace(viewController: viewController)
    }

    func setNavBarColor(color: UIColor = .red) {
        navigationEngine.navigationController.navigationBar.barTintColor = color
    }
}
