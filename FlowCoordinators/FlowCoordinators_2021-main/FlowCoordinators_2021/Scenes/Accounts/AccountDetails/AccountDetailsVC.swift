//
//  AccountDetailsVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class AccountDetailsVC: UIViewController, VCProtocol {
    var accountDetailsVM: AccountDetailsVMProtocol?

    required init(viewModel: VMProtocol) {
        self.accountDetailsVM = viewModel as? AccountDetailsVMProtocol
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
        self.title = "Account Details"
        view.backgroundColor = .systemYellow
    }
}
