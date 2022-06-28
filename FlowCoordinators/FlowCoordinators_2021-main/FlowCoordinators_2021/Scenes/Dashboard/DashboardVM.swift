//
//  DashboardVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol DashboardVMProtocol: VMProtocol {
    func goToOrders()
    func goToAccounts()
    func goToSettings()
}

struct DashboardVM: DashboardVMProtocol {
    var coordinator: DashboardCoordinator?

    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToOrders() {
        coordinator?.presentOrders()
    }
    
    func goToAccounts() {
        coordinator?.presentAccounts()
    }
    
    func goToSettings() {
        coordinator?.presentSettings()
    }
}
