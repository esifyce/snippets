//
//  AddItemVM.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/10/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol AddItemVMProtocol: VMProtocol {

}

struct AddItemVM: AddItemVMProtocol {
    var appCoordinator: AppCoordinator?

    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
    }
}
