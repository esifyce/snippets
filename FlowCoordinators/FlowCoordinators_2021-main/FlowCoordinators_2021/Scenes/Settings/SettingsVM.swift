//
//  SettingsVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol SettingsVMProtocol: VMProtocol {
    func logout()
}

struct SettingsVM: SettingsVMProtocol {
    var coordinator: SettingsCoordinator?

    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }
    
    func logout() {
        coordinator?.proceedToLogin()
    }
}
