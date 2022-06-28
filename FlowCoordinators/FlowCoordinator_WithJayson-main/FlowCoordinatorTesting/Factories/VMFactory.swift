//
//  VMFactory.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/9/21.
//

import Foundation

protocol VMFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol
    static func makeDashboardVM(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) -> DashboardVMProtocol
    static func makeDashboardDetailsVM(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) -> DashboardDetailsVMProtocol
}

struct VMFactory: VMFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol {
        return LoginVM(appCoordinator: appCoordinator)
    }
    static func makeDashboardVM(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) -> DashboardVMProtocol {
        return DashboardVM(appCoordinator: appCoordinator, dashboardCoordinator: dashboardCoordinator)
    }
    static func makeDashboardDetailsVM(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) -> DashboardDetailsVMProtocol {
        return DashboardDetailsVM(appCoordinator: appCoordinator, dashboardCoordinator: dashboardCoordinator)
    }
    static func makeSettingsVM(appCoordinator: AppCoordinator) -> SettingsVMProtocol {
        return SettingsVM(appCoordinator: appCoordinator)
    }
}
