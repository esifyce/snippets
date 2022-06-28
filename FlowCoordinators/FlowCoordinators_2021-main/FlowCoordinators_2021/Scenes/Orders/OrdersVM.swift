//
//  OrdersVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol OrdersVMProtocol: VMProtocol {
    func goToOrderDetails()
}

struct OrdersVM: OrdersVMProtocol {
    var coordinator: OrdersCoordinator?

    init(coordinator: OrdersCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToOrderDetails() {
        coordinator?.presentOrderDetails()
    }
}
