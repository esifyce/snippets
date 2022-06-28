//
//  ViewControllerFactory.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC
    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC
    static func makeOrdersVC(viewModel: OrdersVMProtocol) -> OrdersVC
    static func makeOrderDetailsVC(viewModel: OrderDetailsVMProtocol) -> OrderDetailsVC
    static func makeScanVC(viewModel: ScanVMProtocol) -> ScanVC
    static func makeAddItemVC(viewModel: AddItemVMProtocol) -> AddItemVC
    static func makeInventoryVC(viewModel: InventoryVMProtocol) -> InventoryVC
    static func makeShipmentsVC(viewModel: ShipmentsVMProtocol) -> ShipmentsVC
    static func makeShipmentDetailsVC(viewModel: ShipmentDetailsVMProtocol) -> ShipmentDetailsVC
    static func makeSettingsVC(viewModel: SettingsVMProtocol) -> SettingsVC
    static func makeProductDetailsVC(viewModel: ProductDetailsVMProtocol) -> ProductDetailsVC
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static func makeLoginVC(viewModel: LoginVMProtocol) -> LoginVC {
        return LoginVC(viewModel: viewModel)
    }

    static func makeDashboardVC(viewModel: DashboardVMProtocol) -> DashboardVC {
        return DashboardVC(viewModel: viewModel)
    }

    static func makeOrdersVC(viewModel: OrdersVMProtocol) -> OrdersVC {
        return OrdersVC(viewModel: viewModel)
    }

    static func makeOrderDetailsVC(viewModel: OrderDetailsVMProtocol) -> OrderDetailsVC {
        return OrderDetailsVC(viewModel: viewModel)
    }

    static func makeScanVC(viewModel: ScanVMProtocol) -> ScanVC {
        return ScanVC(viewModel: viewModel)
    }

    static func makeAddItemVC(viewModel: AddItemVMProtocol) -> AddItemVC {
        return AddItemVC(viewModel: viewModel)
    }

    static func makeInventoryVC(viewModel: InventoryVMProtocol) -> InventoryVC {
        return InventoryVC(viewModel: viewModel)
    }

    static func makeShipmentsVC(viewModel: ShipmentsVMProtocol) -> ShipmentsVC {
        return ShipmentsVC(viewModel: viewModel)
    }

    static func makeShipmentDetailsVC(viewModel: ShipmentDetailsVMProtocol) -> ShipmentDetailsVC {
        return ShipmentDetailsVC(viewModel: viewModel)
    }

    static func makeSettingsVC(viewModel: SettingsVMProtocol) -> SettingsVC {
        return SettingsVC(viewModel: viewModel)
    }

    static func makeProductDetailsVC(viewModel: ProductDetailsVMProtocol) -> ProductDetailsVC {
        return ProductDetailsVC(viewModel: viewModel)
    }
}
