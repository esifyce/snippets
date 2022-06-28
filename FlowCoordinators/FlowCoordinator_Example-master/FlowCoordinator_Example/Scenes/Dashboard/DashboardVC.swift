//
//  DashboardVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/8/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, VCProtocol {
    var dashboardVM: DashboardVMProtocol?

    required init(viewModel: VMProtocol) {
        self.dashboardVM = viewModel as? DashboardVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
