//
//  AccountsVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol AccountsVMProtocol: VMProtocol {
    func goToAccountDetails()
}

struct AccountsVM: AccountsVMProtocol {
    var coordinator: AccountsCoordinator?

    init(coordinator: AccountsCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToAccountDetails() {
        coordinator?.presentAccountDetails()
    }
}
