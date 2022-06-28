//
//  ScanVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol ScanVMProtocol: VMProtocol {
    func scanComplete()
}

struct ScanVM: ScanVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }

    func scanComplete() {
        appCoordinator?.scanComplete()
    }
}
