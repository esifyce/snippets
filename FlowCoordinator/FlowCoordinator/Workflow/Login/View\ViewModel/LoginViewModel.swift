//
//  LoginViewModel.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol LoginViewModelProtocol: CoordinatorViewModelProtocol {
    func loginWithCredetials()
}

class LoginViewModel: LoginViewModelProtocol {
    var appCoordinator: AppCoordinator?
    
    required init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func loginWithCredetials() {
        appCoordinator?.presentTabBar()
    }
}
