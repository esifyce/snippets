//
//  ViewModelFactory.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import Foundation

protocol ViewModelFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol
    static func makeDashboardVM(appCoordinator: AppCoordinator) -> DashboardVMProtocol
    static func makeOrdersVM(appCoordinator: AppCoordinator) -> OrdersVMProtocol
    static func makeOrderDetailsVM(appCoordinator: AppCoordinator) -> OrderDetailsVMProtocol
    static func makeScanVM(appCoordinator: AppCoordinator) -> ScanVMProtocol
    static func makeAddItemVM(appCoordinator: AppCoordinator) -> AddItemVMProtocol
    static func makeInventoryVM(appCoordinator: AppCoordinator) -> InventoryVMProtocol
    static func makeShipmentsVM(appCoordinator: AppCoordinator) -> ShipmentsVMProtocol
    static func makeShipmentDetailsVM(appCoordinator: AppCoordinator) -> ShipmentDetailsVMProtocol
    static func makeSettingsVM(appCoordinator: AppCoordinator) -> SettingsVMProtocol
    static func makeProductDetailsVM(appCoordinator: AppCoordinator) -> ProductDetailsVMProtocol
}

struct ViewModelFactory: ViewModelFactoryProtocol {
    static func makeLoginVM(appCoordinator: AppCoordinator) -> LoginVMProtocol {
        return LoginVM(coordinator: appCoordinator)
    }

    static func makeDashboardVM(appCoordinator: AppCoordinator) -> DashboardVMProtocol {
        return DashboardVM(coordinator: appCoordinator)
    }

    static func makeOrdersVM(appCoordinator: AppCoordinator) -> OrdersVMProtocol {
        return OrdersVM(coordinator: appCoordinator)
    }

    static func makeOrderDetailsVM(appCoordinator: AppCoordinator) -> OrderDetailsVMProtocol {
        return OrderDetailsVM(coordinator: appCoordinator)
    }

    static func makeScanVM(appCoordinator: AppCoordinator) -> ScanVMProtocol {
        return ScanVM(coordinator: appCoordinator)
    }

    static func makeAddItemVM(appCoordinator: AppCoordinator) -> AddItemVMProtocol {
        return AddItemVM(coordinator: appCoordinator)
    }

    static func makeInventoryVM(appCoordinator: AppCoordinator) -> InventoryVMProtocol {
        return InventoryVM(coordinator: appCoordinator)
    }

    static func makeShipmentsVM(appCoordinator: AppCoordinator) -> ShipmentsVMProtocol {
        return ShipmentsVM(coordinator: appCoordinator)
    }

    static func makeShipmentDetailsVM(appCoordinator: AppCoordinator) -> ShipmentDetailsVMProtocol {
        return ShipmentDetailsVM(coordinator: appCoordinator)
    }

    static func makeSettingsVM(appCoordinator: AppCoordinator) -> SettingsVMProtocol {
        return SettingsVM(coordinator: appCoordinator)
    }

    static func makeProductDetailsVM(appCoordinator: AppCoordinator) -> ProductDetailsVMProtocol {
        return ProductDetailsVM(coordinator: appCoordinator)
    }
}
