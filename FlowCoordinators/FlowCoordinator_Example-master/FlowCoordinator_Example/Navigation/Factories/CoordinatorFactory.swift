//
//  CoordinatorFactory.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator
    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator
    static func makeTabBarCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> TabBarCoordinator
    static func makeDashboardCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> DashboardCoordinator
    static func makeOrdersCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> OrdersCoordinator
    static func makeScanCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ScanCoordinator
    static func makeShipmentsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ShipmentsCoordinator
    static func makeProductDetailsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ProductDetailsCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    static func makeAppCoordinator(navigationEngine: NavigationEngineProtocol) -> AppCoordinator {
        return AppCoordinator(navigationEngine: navigationEngine)
    }

    static func makeLoginCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> LoginCoordinator {
        return LoginCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeTabBarCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> TabBarCoordinator {
        return TabBarCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeDashboardCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> DashboardCoordinator {
        return DashboardCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeOrdersCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> OrdersCoordinator {
        return OrdersCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeScanCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ScanCoordinator {
        return ScanCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeShipmentsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ShipmentsCoordinator {
        return ShipmentsCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }

    static func makeProductDetailsCoordinator(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) -> ProductDetailsCoordinator {
        return ProductDetailsCoordinator(navigationEngine: navigationEngine, appCoordinator: appCoordinator)
    }
}
