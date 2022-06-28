//
//  TabBarCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation
import UIKit

class TabBarCoordinator: BaseCoordinator, CoordinatorProtocol {
    let engine: NavigationEngineProtocol
    let coordinator: AppCoordinator
    
    var tabBarController: UITabBarController
    
    var firstVM: FirstViewModelProtocol
    var secondVM: SecondViewModelProtocol
    
    required init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator) {
        engine = navigationEngine
        coordinator = appCoordinator
        
        self.tabBarController = .init()
        firstVM = FactoryCoordinatorViewModel.makeFirstVM(appCoordinator: coordinator)
        secondVM = FactoryCoordinatorViewModel.makeSecondVM(appCoordinator: coordinator)
    }
    
    override func start() {
        buildTabBar()
    }
    
    func buildTabBar() {
        // Tab 1
        let firstVC = FactoryCoordinatorViewController.makeFirstVC(viewModel: firstVM)
        firstVC.title = "FIRST"
        firstVC.tabBarItem = UITabBarItem.init(title: "First", image: UIImage(systemName: "drop.fill"), tag: 0)

        // Tab 2
        let secondVC = FactoryCoordinatorViewController.makeSecondVC(viewModel: secondVM)
        secondVC.title = "Second"
        secondVC.tabBarItem = UITabBarItem.init(title: "Second", image: UIImage(systemName: "cloud.fill"), tag: 1)
        
        let controllerArray = [firstVC, secondVC]
        tabBarController.setViewControllers(controllerArray, animated: true)

        engine.navigationController.viewControllers = [tabBarController]
    }
}
