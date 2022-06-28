//
//  AccountDetailsVM.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol AccountDetailsVMProtocol: VMProtocol { }

struct AccountDetailsVM: AccountDetailsVMProtocol {
    var coordinator: AccountsCoordinator?

    init(coordinator: AccountsCoordinator) {
        self.coordinator = coordinator
    }
}
