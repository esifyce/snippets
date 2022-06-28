//
//  LoginCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

class LoginCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    override func start() {
        let loginVM = VMFactory.makeLoginVM(appCoordinator: coordinator)
        let loginVC = VCFactory.makeLoginVC(viewModel: loginVM)
        engine.replace(viewController: loginVC)
    }
}
