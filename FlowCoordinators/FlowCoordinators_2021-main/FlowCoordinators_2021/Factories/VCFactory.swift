//
//  VCFactory.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import Foundation

protocol VCFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC
    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC
    static func makeOrdersVC(viewModel: OrdersVMProtocol) -> OrdersVC
    static func makeAccountsVC(viewModel: AccountsVMProtocol) -> AccountsVC
    static func makeSettingsVC(viewModel: SettingsVMProtocol) -> SettingsVC
    static func makeOrderDetailsVC(viewModel: OrderDetailsVMProtocol) -> OrderDetailsVC
    static func makeAccountDetailsVC(viewModel: AccountDetailsVMProtocol) -> AccountDetailsVC
}

struct VCFactory: VCFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC {
        return LoginVC(viewModel: viewModel)
    }

    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC {
        return DashboardVC(viewModel: viewModel)
    }

    static func makeOrdersVC(viewModel: OrdersVMProtocol) -> OrdersVC {
        return OrdersVC(viewModel: viewModel)
    }

    static func makeAccountsVC(viewModel: AccountsVMProtocol) -> AccountsVC {
        return AccountsVC(viewModel: viewModel)
    }

    static func makeSettingsVC(viewModel: SettingsVMProtocol) -> SettingsVC {
        return SettingsVC(viewModel: viewModel)
    }

    static func makeOrderDetailsVC(viewModel: OrderDetailsVMProtocol) -> OrderDetailsVC {
        return OrderDetailsVC(viewModel: viewModel)
    }

    static func makeAccountDetailsVC(viewModel: AccountDetailsVMProtocol) -> AccountDetailsVC {
        return AccountDetailsVC(viewModel: viewModel)
    }
}
