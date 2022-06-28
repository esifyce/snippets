//
//  LoginCoordinator.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/16/21.
//

import UIKit

class LoginCoordinator: Coordinator {
    var engine: NavigationEngineProtocol
    var coordinator: AppCoordinator
    var context: NavigationEngineContext!

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    func start() {
        context = engine.context
        let loginVM = VMFactory.makeLoginVM(appCoordinator: coordinator)
        let loginVC = VCFactory.makeLoginVC(viewModel: loginVM)
        context.replace(viewController: loginVC)
    }
}
