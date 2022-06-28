//
//  SettingsVM.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 8/6/21.
//

protocol SettingsVMProtocol: VMProtocol {
    func logout()
}

class SettingsVM: SettingsVMProtocol {
    var appCoordinator: AppCoordinator

    required init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func logout() {
        appCoordinator.start()
    }
}
