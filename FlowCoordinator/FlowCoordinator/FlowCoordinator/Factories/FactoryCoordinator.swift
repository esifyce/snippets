//
//  FactoryCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation


protocol FactoryCordinatorProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator
    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator
    static func makeTabBarCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> TabBarCoordinator

}

final class FactoryCordinator: FactoryCordinatorProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator {
        return AppCoordinator(navigationEngine: navigationEngine)
    }
    
    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator {
        return LoginCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }
    
    static func makeTabBarCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> TabBarCoordinator {
        return TabBarCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }
}
