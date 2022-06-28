//
//  ShipmentDetailsVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/10/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class ShipmentDetailsVC: UIViewController, VCProtocol {
    var shipmentDetailsVM: ShipmentDetailsVMProtocol?

    required init(viewModel: VMProtocol) {
        self.shipmentDetailsVM = viewModel as? ShipmentDetailsVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        self.title = "Shipment Details"
    }
}
