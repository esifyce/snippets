//
//  ScanCoordinator.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

class ScanCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    func scanComplete() {
        let productDetailsVM = ViewModelFactory.makeProductDetailsVM(appCoordinator: coordinator)
        let productDetailsVC = ViewControllerFactory.makeProductDetailsVC(viewModel: productDetailsVM)
        engine.push(viewController: productDetailsVC)
    }
}
