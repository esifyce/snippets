//
//  VCFactory.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/9/21.
//

import Foundation

protocol VCFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC
    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC
    static func makeDashboardDetailsVC(viewModel: DashboardDetailsVMProtocol) -> DashboardDetailsVC
}

struct VCFactory: VCFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC {
        return LoginVC(viewModel: viewModel)
    }
    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC {
        return DashboardVC(viewModel: viewModel)
    }
    static func makeDashboardDetailsVC(viewModel: DashboardDetailsVMProtocol) -> DashboardDetailsVC {
        return DashboardDetailsVC(viewModel: viewModel)
    }
    static func makeSettingsVC(viewModel: SettingsVMProtocol) -> SettingsVC {
        return SettingsVC(viewModel: viewModel)
    }
}
