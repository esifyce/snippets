//
//  DashboardCoordinator.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation
import UIKit

class DashboardCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    override func start() {
        let viewModel = ViewModelFactory.makeDashboardVM(appCoordinator: coordinator)
        let viewController = ViewControllerFactory.makeDashboardVC(viewModel: viewModel)
        engine.replace(viewController: viewController)
    }
}
