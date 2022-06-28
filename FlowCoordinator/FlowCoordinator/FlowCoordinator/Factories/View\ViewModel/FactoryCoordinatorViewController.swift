//
//  FactoryCoordinatorViewController.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol FactoryCoordinatorViewControllerProtocol {
    static func makeLoginVC(viewModel: LoginViewModelProtocol) -> LoginViewController
    static func makeFirstVC(viewModel: FirstViewModelProtocol) -> FirstViewController
    static func makeSecondVC(viewModel: SecondViewModelProtocol) -> SecondViewController
}

struct FactoryCoordinatorViewController: FactoryCoordinatorViewControllerProtocol {
    static func makeLoginVC(viewModel: LoginViewModelProtocol) -> LoginViewController {
        return LoginViewController(viewModel: viewModel)
    }
    
    static func makeFirstVC(viewModel: FirstViewModelProtocol) -> FirstViewController {
        return FirstViewController(viewModel: viewModel)
    }
    
    static func makeSecondVC(viewModel: SecondViewModelProtocol) -> SecondViewController {
        return SecondViewController(viewModel: viewModel)
    }
    
}
