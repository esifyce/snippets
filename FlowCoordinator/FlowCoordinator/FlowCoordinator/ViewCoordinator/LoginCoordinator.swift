//
//  LoginCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

class LoginCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    var coordinator: AppCoordinator
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }
    
    override func start() {
        let loginViewModel = FactoryCoordinatorViewModel.makeLoginVM(appCoordinator: coordinator)
        let loginViewController = FactoryCoordinatorViewController.makeLoginVC(viewModel: loginViewModel)
        engine.replace(viewController: loginViewController)
    }
}
