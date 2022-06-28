//
//  AppCoordinator.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/16/21.
//

import UIKit

protocol Coordinator {
    var engine: NavigationEngineProtocol { get }
    var coordinator: AppCoordinator { get }

    init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator)

    func start()
}

class AppCoordinator {
    let engine: NavigationEngineProtocol
    let window: UIWindow

    init(navigationEngine: NavigationEngineProtocol, window: UIWindow) {
        engine = navigationEngine
        self.window = window
    }

    func start() {
        let loginCoordinator = FlowCoordinatorFactory.makeLoginCoordinator(navigationEngine: engine, appCoordinator: self)
        loginCoordinator.start()
    }

    func presentDashboard() {
        print("Present Dashboard")
        let dashboardCoordinator = FlowCoordinatorFactory.makeDashboardCoordinator(navigationEngine: engine, appCoordinator: self)
        dashboardCoordinator.start()
    }

    func presentSettings() {
        let settingsCoordinator = FlowCoordinatorFactory.makeSettingsCoordinator(navigationEngine: engine, appCoordinator: self)
        settingsCoordinator.start()
    }
}
