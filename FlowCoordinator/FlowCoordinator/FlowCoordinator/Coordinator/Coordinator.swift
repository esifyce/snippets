//
//  Coordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol CoordinatorProtocol {
    var engine: NavigationEngineProtocol { get }
    var coordinator: AppCoordinator { get }
    
    init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator)
}

protocol Coordinator {
    func start()
}
