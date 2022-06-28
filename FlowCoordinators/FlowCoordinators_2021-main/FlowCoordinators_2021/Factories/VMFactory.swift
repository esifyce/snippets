//
//  VMFactory.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol VMFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol
    static func makeDashboardVM(coordinator: DashboardCoordinator) -> DashboardVMProtocol
    static func makeOrdersVM(coordinator: OrdersCoordinator) -> OrdersVMProtocol
    static func makeAccountsVM(coordinator: AccountsCoordinator) -> AccountsVMProtocol
    static func makeSettingsVM(coordinator: SettingsCoordinator) -> SettingsVMProtocol
    static func makeOrderDetailsVM(coordinator: OrdersCoordinator) -> OrderDetailsVMProtocol
    static func makeAccountDetailsVM(coordinator: AccountsCoordinator) -> AccountDetailsVMProtocol
}

struct VMFactory: VMFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol {
        return LoginVM(coordinator: appCoordinator)
    }

    static func makeDashboardVM(coordinator: DashboardCoordinator) -> DashboardVMProtocol {
        return DashboardVM(coordinator: coordinator)
    }

    static func makeOrdersVM(coordinator: OrdersCoordinator) -> OrdersVMProtocol {
        return OrdersVM(coordinator: coordinator)
    }

    static func makeAccountsVM(coordinator: AccountsCoordinator) -> AccountsVMProtocol {
        return AccountsVM(coordinator: coordinator)
    }

    static func makeSettingsVM(coordinator: SettingsCoordinator) -> SettingsVMProtocol {
        return SettingsVM(coordinator: coordinator)
    }

    static func makeOrderDetailsVM(coordinator: OrdersCoordinator) -> OrderDetailsVMProtocol {
        return OrderDetailsVM(coordinator: coordinator)
    }

    static func makeAccountDetailsVM(coordinator: AccountsCoordinator) -> AccountDetailsVMProtocol {
        return AccountDetailsVM(coordinator: coordinator)
    }
}
