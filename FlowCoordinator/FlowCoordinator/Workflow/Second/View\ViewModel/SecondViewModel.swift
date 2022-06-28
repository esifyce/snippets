//
//  SecondViewModel.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import Foundation

protocol SecondViewModelProtocol: CoordinatorViewModelProtocol {
    func logoutWithCredetials()
}

class SecondViewModel: SecondViewModelProtocol {
    
    var appCoordinator: AppCoordinator?

    required init(appCoordinator coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }
    
    func logoutWithCredetials() {
        appCoordinator?.start()
    }
}
