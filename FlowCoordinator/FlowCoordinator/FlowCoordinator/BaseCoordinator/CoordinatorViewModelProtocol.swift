//
//  CoordinatorViewModelProtocol.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol CoordinatorViewModelProtocol {
    var appCoordinator: AppCoordinator? { get }
    init(appCoordinator: AppCoordinator)
}
