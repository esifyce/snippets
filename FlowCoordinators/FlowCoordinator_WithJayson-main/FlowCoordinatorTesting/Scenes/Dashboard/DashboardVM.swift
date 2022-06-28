//
//  DashboardVM.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/14/21.
//

import Foundation

protocol DashboardVMProtocol: VMProtocol {
    func presentDetails()
    func presentSettings()
    func presentTransactionHistory()
}

struct DashboardVM: DashboardVMProtocol {
    var appCoordinator: AppCoordinator
    var dashboardCoordinator: DashboardCoordinator?

    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    init(appCoordinator: AppCoordinator, dashboardCoordinator: DashboardCoordinator) {
        self.appCoordinator = appCoordinator
        self.dashboardCoordinator = dashboardCoordinator
    }

    
    func presentDetails() {
        print("Going to Details")
        dashboardCoordinator?.presentDashboardDetails()
    }

    func presentSettings() {
        print("Going to Settings")
        appCoordinator.presentSettings()
    }

    func presentTransactionHistory() {
        print("Going to Transaction History")
    }
}
