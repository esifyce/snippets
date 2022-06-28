//
//  SettingsVC.swift
//  FlowCoordinatorTesting
//
//  Created by Elayda,Jayson on 8/6/21.
//

import UIKit

class SettingsVC: UIViewController {
    var settingsVM: SettingsVMProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        view.backgroundColor = .purple
        createButtons()
    }

    init(viewModel: SettingsVMProtocol) {
        settingsVM = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createButtons() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(self.logoutAction), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc private func logoutAction() {
        settingsVM?.logout()
    }
}
