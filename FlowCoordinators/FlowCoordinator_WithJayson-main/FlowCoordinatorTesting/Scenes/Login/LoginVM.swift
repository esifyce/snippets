//
//  LoginVM.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/9/21.
//

import Foundation

protocol LoginVMProtocol: VMProtocol {
    func loginWithCredentials()
}

struct LoginVM: LoginVMProtocol {
    var appCoordinator: AppCoordinator

    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func loginWithCredentials() {
        print("loggin in")
        appCoordinator.presentDashboard()
    }
}
