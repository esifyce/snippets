//
//  SettingsCoordinator.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 8/6/21.
//

import UIKit

class SettingsCoordinator: Coordinator {
    var engine: NavigationEngineProtocol
    var coordinator: AppCoordinator
    var context: NavigationEngineContext!

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    func start() {
        context = engine.context
        let settingsVM = VMFactory.makeSettingsVM(appCoordinator: coordinator)
        let settingsVC = VCFactory.makeSettingsVC(viewModel: settingsVM)
        context.push(viewController: settingsVC)
    }
}
