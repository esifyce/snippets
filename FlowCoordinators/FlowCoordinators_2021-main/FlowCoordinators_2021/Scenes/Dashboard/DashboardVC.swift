//
//  DashboardVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class DashboardVC: UIViewController, VCProtocol {
    var dashboardVM: DashboardVMProtocol?
    
    private var ordersButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Orders", for: .normal)
        button.addTarget(self, action: #selector(self.ordersButtonAction), for: .touchUpInside)
        return button
    }

    private var accountsButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Accounts", for: .normal)
        button.addTarget(self, action: #selector(self.accountsButtonAction), for: .touchUpInside)
        return button
    }
    
    private var settingsButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(self.settingsButtonAction), for: .touchUpInside)
        return button
    }
    
    required init(viewModel: VMProtocol) {
        self.dashboardVM = viewModel as? DashboardVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: UI
    private func setupUI() {
        self.title = "Dashboard"
        view.backgroundColor = .systemBlue
        setupStackView()
    }
    
    private func setupStackView() {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .equalSpacing
        buttonsStackView.spacing = 50
        buttonsStackView.addArrangedSubview(ordersButton)
        buttonsStackView.addArrangedSubview(accountsButton)
        buttonsStackView.addArrangedSubview(settingsButton)
        
        view.addSubview(buttonsStackView)
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    // MARK: Actions
    @objc private func ordersButtonAction() {
        dashboardVM?.goToOrders()
    }

    @objc private func accountsButtonAction() {
        dashboardVM?.goToAccounts()
    }

    @objc private func settingsButtonAction() {
        dashboardVM?.goToSettings()
    }
}
