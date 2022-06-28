//
//  FirstViewModel.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol FirstViewModelProtocol: CoordinatorViewModelProtocol {

}

class FirstViewModel: FirstViewModelProtocol {
    var appCoordinator: AppCoordinator?

    required init(appCoordinator coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }
}
