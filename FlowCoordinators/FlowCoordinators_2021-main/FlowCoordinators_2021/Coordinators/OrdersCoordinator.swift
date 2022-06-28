//
//  OrdersCoordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

class OrdersCoordinator: BaseCoordinator, CoordinatorProtocol {
    var engine: NavigationEngineProtocol
    
    var coordinator: AppCoordinator
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }
    
    override func start() {
        let vm = VMFactory.makeOrdersVM(coordinator: self)
        let vc = VCFactory.makeOrdersVC(viewModel: vm)
        engine.push(viewController: vc)
    }
    
    func presentOrderDetails() {
        let vm = VMFactory.makeOrderDetailsVM(coordinator: self)
        let vc = VCFactory.makeOrderDetailsVC(viewModel: vm)
        engine.push(viewController: vc)
    }
}
