//
//  AppCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    let engine: NavigationEngineProtocol

    init(navigationEngine: NavigationEngineProtocol) {
        engine = navigationEngine
        super.init()
    }
    
    // root view
    override func start() {
        let loginCoordinator = CoordinatorFactory.makeLoginCoordinator(navigationEngine: engine, appCoordinator: self)
        loginCoordinator.start()
    }
    
    func presentDashboard() {
        let dashboardCoordinator = CoordinatorFactory.makeDashboardCoordinator(navigationEngine: engine, appCoordinator: self)
        dashboardCoordinator.start()
    }
}
