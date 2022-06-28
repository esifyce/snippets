//
//  SecondCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

class SecondCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    override func start() {
        let viewModel = FactoryCoordinatorViewModel.makeSecondVM(appCoordinator: coordinator)
        let viewController = FactoryCoordinatorViewController.makeSecondVC(viewModel: viewModel)
    
        engine.replace(viewController: viewController)
    }
}
