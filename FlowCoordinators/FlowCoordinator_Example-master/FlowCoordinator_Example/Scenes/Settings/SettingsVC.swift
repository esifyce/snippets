//
//  SettingsVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, VCProtocol {
    var settingsVM: SettingsVMProtocol?

    required init(viewModel: VMProtocol) {
        self.settingsVM = viewModel as? SettingsVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.title = "Settings"

    }
}

