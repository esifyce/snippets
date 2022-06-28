//
//  DashboardVC.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 7/14/21.
//

import UIKit

class DashboardVC: UIViewController {
    var dashboardVM: DashboardVMProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dashboard"
        view.backgroundColor = .red
        createButtons()
    }

    init(viewModel: DashboardVMProtocol) {
        dashboardVM = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createButtons() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.addTarget(self, action: #selector(self.detailsAction), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Settings", for: .normal)
        button2.addTarget(self, action: #selector(self.settingsAction), for: .touchUpInside)
        view.addSubview(button2)
        button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50).isActive = true
        button2.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
    }

    @objc private func detailsAction() {
        dashboardVM?.presentDetails()
    }

    @objc private func settingsAction() {
        dashboardVM?.presentSettings()
    }
}
