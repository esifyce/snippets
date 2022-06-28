//
//  DashboardVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol DashboardVMProtocol: VMProtocol {

}

struct DashboardVM: DashboardVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }
}
