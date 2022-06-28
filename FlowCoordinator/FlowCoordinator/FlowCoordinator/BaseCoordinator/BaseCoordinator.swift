//
//  BaseCoordinator.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

class BaseCoordinator: Coordinator {
    func start() {
        fatalError("Children should implement 'start'.")
    }
}
