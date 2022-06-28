//
//  DashboardDetailsVC.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/28/21.
//

import UIKit

class DashboardDetailsVC: UIViewController {
    var dashboardDetailsVM: DashboardDetailsVMProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dashboard Details"
        view.backgroundColor = .green
    }

    init(viewModel: DashboardDetailsVMProtocol) {
        dashboardDetailsVM = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        dashboardDetailsVM?.dashboardCoordinator?.context.setNavBarColor(color: .lightGray)
    }
}
