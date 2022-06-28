//
//  VMProtocol.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/28/21.
//

import Foundation

protocol VMProtocol {
    var appCoordinator: AppCoordinator { get }

    init(appCoordinator: AppCoordinator)
}
