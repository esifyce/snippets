//
//  AppCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    private let engine: NavigationEngineProtocol
    
    init(navigationEngine: NavigationEngineProtocol) {
        engine = navigationEngine
        super.init()
    }
    
    // root view
    override func start() {
        let loginCoordinator = FactoryCordinator.makeLoginCoordinator(navigationEngine: engine, appCoordinator: self)
        loginCoordinator.start()
    }
    
    func presentTabBar() {
        let tabBarCoordinator = FactoryCordinator.makeTabBarCoordinator(navigationEngine: engine, appCoordinator: self)
        tabBarCoordinator.start()
    }
}
