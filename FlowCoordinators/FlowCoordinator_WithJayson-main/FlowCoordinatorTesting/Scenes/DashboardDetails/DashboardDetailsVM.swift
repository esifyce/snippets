//
//  DashboardDetailsVM.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/28/21.
//

import Foundation

protocol DashboardDetailsVMProtocol: VMProtocol {
    var dashboardCoordinator: DashboardCoordinator? { get set }
}

class DashboardDetailsVM: DashboardDetailsVMProtocol {
    var appCoordinator: AppCoordinator
    var dashboardCoordinator: DashboardCoordinator?

    required init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    init(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) {
        self.appCoordinator = appCoordinator
        self.dashboardCoordinator = dashboardCoordinator
    }
}
