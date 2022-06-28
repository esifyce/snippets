//
//  OrderDetailsVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol OrderDetailsVMProtocol: VMProtocol { }

struct OrderDetailsVM: OrderDetailsVMProtocol {
//    var appCoordinator: AppCoordinator?
//    
//    init(coordinator: AppCoordinator) {
//        
//    }
    
    var coordinator: OrdersCoordinator?

    init(coordinator: OrdersCoordinator) {
        self.coordinator = coordinator
    }
}
