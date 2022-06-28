//
//  FirstCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

class FirstCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    override func start() {
        let viewModel = FactoryCoordinatorViewModel.makeFirstVM(appCoordinator: coordinator)
        let viewController = FactoryCoordinatorViewController.makeFirstVC(viewModel: viewModel)
    
        engine.replace(viewController: viewController)
    }
}
