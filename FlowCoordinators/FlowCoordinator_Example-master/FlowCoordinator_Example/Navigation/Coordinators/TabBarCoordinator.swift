//
//  TabBarCoordinator.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator

    var tabBarController: UITabBarController

    var dashboardVM: DashboardVMProtocol
    var ordersVM: OrdersVMProtocol
    var scanVM: ScanVMProtocol
    var inventoryVM: InventoryVMProtocol
    var shipmentsVM: ShipmentsVMProtocol


    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator

        self.tabBarController = .init()
        dashboardVM = ViewModelFactory.makeDashboardVM(appCoordinator: coordinator)
        ordersVM = ViewModelFactory.makeOrdersVM(appCoordinator: coordinator)
        scanVM = ViewModelFactory.makeScanVM(appCoordinator: coordinator)
        inventoryVM = ViewModelFactory.makeInventoryVM(appCoordinator: coordinator)
        shipmentsVM = ViewModelFactory.makeShipmentsVM(appCoordinator: coordinator)
    }

    override func start() {
        buildTabBar()
    }

    func buildTabBar() {
        // Tab 1
        let dashboardVC = ViewControllerFactory.makeDashboardVC(viewModel: dashboardVM)
        dashboardVC.title = "Dashboard"
        dashboardVC.tabBarItem = UITabBarItem.init(title: "Dashboard", image: UIImage(named: "Dashboard"), tag: 0)

        // Tab 2
        let ordersVC = ViewControllerFactory.makeOrdersVC(viewModel: ordersVM)
        ordersVC.title = "Orders"
        ordersVC.tabBarItem = UITabBarItem.init(title: "Orders", image: UIImage(named: "Orders"), tag: 1)

        // Tab 3
        let scanVC = ViewControllerFactory.makeScanVC(viewModel: scanVM)
        scanVC.title = "Scan"
        scanVC.tabBarItem = UITabBarItem.init(title: "Scan", image: UIImage(named: "Scan"), tag: 2)

        // Tab 4
        let inventoryVC = ViewControllerFactory.makeInventoryVC(viewModel: inventoryVM)
        inventoryVC.title = "Inventory"
        inventoryVC.tabBarItem = UITabBarItem.init(title: "Inventory", image: UIImage(named: "Inventory"), tag: 3)

        // Tab 5
        let shipmentsVC = ViewControllerFactory.makeShipmentsVC(viewModel: shipmentsVM)
        shipmentsVC.title = "Shipments"
        shipmentsVC.tabBarItem = UITabBarItem.init(title: "Shipments", image: UIImage(named: "Shipments"), tag: 3)

        let controllerArray = [dashboardVC, ordersVC, scanVC, inventoryVC, shipmentsVC]
        tabBarController.setViewControllers(controllerArray, animated: true)

        engine.navigationController.viewControllers = [tabBarController]
   }
}
