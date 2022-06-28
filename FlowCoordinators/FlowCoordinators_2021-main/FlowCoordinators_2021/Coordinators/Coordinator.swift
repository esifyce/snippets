//
//  Coordinator.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol CoordinatorProtocol {
    var engine: NavigationEngineProtocol { get }
    var coordinator: AppCoordinator { get }

    init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator)
}

protocol Coordinator: AnyObject {
    func start()
}

class BaseCoordinator: Coordinator {
    func start() {
        fatalError("Children should implement 'start'.")
    }
}
