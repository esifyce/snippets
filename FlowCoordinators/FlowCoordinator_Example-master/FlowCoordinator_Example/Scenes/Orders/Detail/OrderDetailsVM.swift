//
//  OrderDetailsVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol OrderDetailsVMProtocol: VMProtocol {
    func goToProductDetails()
}

struct OrderDetailsVM: OrderDetailsVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }

    func goToProductDetails() {
        appCoordinator?.presentProductDetails()
    }
}
