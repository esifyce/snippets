//
//  ShipmentDetailsVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/10/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol ShipmentDetailsVMProtocol: VMProtocol {

}

struct ShipmentDetailsVM: ShipmentDetailsVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }
}
