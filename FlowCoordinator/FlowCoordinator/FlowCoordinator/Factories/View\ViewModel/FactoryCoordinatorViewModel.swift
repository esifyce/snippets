//
//  FactoryCoordinatorViewModel.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol FactoryCoordinatorViewModelProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginViewModelProtocol
    static func makeFirstVM(appCoordinator: AppCoordinator) -> FirstViewModelProtocol
    static func makeSecondVM(appCoordinator: AppCoordinator) -> SecondViewModelProtocol
}

struct FactoryCoordinatorViewModel: FactoryCoordinatorViewModelProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginViewModelProtocol {
        return LoginViewModel(appCoordinator: appCoordinator)
    }
    
    static func makeFirstVM(appCoordinator: AppCoordinator) -> FirstViewModelProtocol {
        return FirstViewModel(appCoordinator: appCoordinator)
    }
    
    static func makeSecondVM(appCoordinator: AppCoordinator) -> SecondViewModelProtocol {
        return SecondViewModel(appCoordinator: appCoordinator)
    }
}
