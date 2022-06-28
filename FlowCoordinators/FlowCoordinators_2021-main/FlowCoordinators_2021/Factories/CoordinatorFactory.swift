//
//  CoordinatorFactory.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator
    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator
    static func makeDashboardCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> DashboardCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator {
        return AppCoordinator(navigationEngine: navigationEngine)
    }

    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator {
        return LoginCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeDashboardCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> DashboardCoordinator {
        return DashboardCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeOrdersCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> OrdersCoordinator {
        return OrdersCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeAccountsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> AccountsCoordinator {
        return AccountsCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeSettingsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> SettingsCoordinator {
        return SettingsCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }
}
