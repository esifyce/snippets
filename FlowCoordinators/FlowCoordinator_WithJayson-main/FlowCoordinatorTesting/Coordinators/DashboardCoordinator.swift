//
//  DashboardCoordinator.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/28/21.
//

import UIKit

class DashboardCoordinator: Coordinator {
    var engine: NavigationEngineProtocol
    var coordinator: AppCoordinator
    var context: NavigationEngineContext!

    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
    }

    func start() {
        context = engine.context
        let dashboardVM = VMFactory.makeDashboardVM(appCoordinator: coordinator, dashboardCoordinator: self)
        let dashboardVC = VCFactory.makeDashboardVC(viewModel: dashboardVM)
        context.push(viewController: dashboardVC)
    }

    func presentDashboardDetails() {
        let dashboardDetailsVM = VMFactory.makeDashboardDetailsVM(appCoordinator: coordinator, dashboardCoordinator: self)
        let dashboardDetailsVC = VCFactory.makeDashboardDetailsVC(viewModel: dashboardDetailsVM)
        context.setNavBarColor(color: .purple)
        context.push(viewController: dashboardDetailsVC)
    }
}
