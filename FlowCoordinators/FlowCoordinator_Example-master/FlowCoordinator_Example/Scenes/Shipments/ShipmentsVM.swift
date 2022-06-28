//
//  ShipmentsVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol ShipmentsVMProtocol: VMProtocol {
    func displayShipmentDetails()
}

struct ShipmentsVM: ShipmentsVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }

    func displayShipmentDetails() {
        appCoordinator?.presentShipmentDetails()
    }
}
