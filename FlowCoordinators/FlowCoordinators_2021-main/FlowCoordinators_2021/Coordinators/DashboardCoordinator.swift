//
//  DashboardCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

class DashboardCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    
    var coordinator: AppCoordinator
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }
    
    override func start() {
        let vm = VMFactory.makeDashboardVM(coordinator: self)
        let vc = VCFactory.makeDashboardVC(viewModel: vm)
        engine.replace(viewController: vc)
    }
    
    func presentOrders() {
        CoordinatorFactory.makeOrdersCoordinator(navigationEngine: engine, appCoordinator: coordinator).start()
    }
    
    func presentAccounts() {
        CoordinatorFactory.makeAccountsCoordinator(navigationEngine: engine, appCoordinator: coordinator).start()
    }
    
    func presentSettings() {
        CoordinatorFactory.makeSettingsCoordinator(navigationEngine: engine, appCoordinator: coordinator).start()
    }
}
