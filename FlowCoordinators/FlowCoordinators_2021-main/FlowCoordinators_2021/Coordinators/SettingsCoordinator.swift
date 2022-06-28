//
//  SettingsCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

class SettingsCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    
    var coordinator: AppCoordinator
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }
    
    override func start() {
        let vm = VMFactory.makeSettingsVM(coordinator: self)
        let vc = VCFactory.makeSettingsVC(viewModel: vm)
        engine.push(viewController: vc)
    }
    
    func proceedToLogin() {
        coordinator.start()
    }
}
