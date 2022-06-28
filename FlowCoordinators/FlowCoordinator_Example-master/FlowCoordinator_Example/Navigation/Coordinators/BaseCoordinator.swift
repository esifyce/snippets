//
//  BaseCoordinator.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement 'start'.")
    }
}
