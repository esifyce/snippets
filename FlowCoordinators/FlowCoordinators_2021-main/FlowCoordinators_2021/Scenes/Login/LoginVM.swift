//
//  LoginVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol LoginVMProtocol: VMProtocol {
    func loginWithCredentials()
}

struct LoginVM: LoginVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }

    func loginWithCredentials() {
        appCoordinator?.presentDashboard()
    }
}
