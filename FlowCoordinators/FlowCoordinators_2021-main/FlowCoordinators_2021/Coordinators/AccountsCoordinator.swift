//
//  AccountsCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

class AccountsCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    
    var coordinator: AppCoordinator
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }
    
    override func start() {
        let vm = VMFactory.makeAccountsVM(coordinator: self)
        let vc = VCFactory.makeAccountsVC(viewModel: vm)
        engine.push(viewController: vc)
    }
    
    func presentAccountDetails() {
        let vm = VMFactory.makeAccountDetailsVM(coordinator: self)
        let vc = VCFactory.makeAccountDetailsVC(viewModel: vm)
        engine.push(viewController: vc)
    }
}
