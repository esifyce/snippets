//
//  VMProtocol.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol VMProtocol {
    var appCoordinator: AppCoordinator? { get }
    init(coordinator: AppCoordinator)
}

