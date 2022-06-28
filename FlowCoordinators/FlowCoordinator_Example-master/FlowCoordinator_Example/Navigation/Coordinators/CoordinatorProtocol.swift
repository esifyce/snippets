//
//  CoordinatorProtocol.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol {
    var engine: NavigationEngineProtocol { get }
    var coordinator: AppCoordinator { get }

    init(navigationEngine: NavigationEngineProtocol, appCoordinator: AppCoordinator)
}

