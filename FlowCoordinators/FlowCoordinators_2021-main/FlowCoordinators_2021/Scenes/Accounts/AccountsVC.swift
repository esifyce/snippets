//
//  AccountsVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class AccountsVC: UIViewController, VCProtocol {
    var accountsVM: AccountsVMProtocol?

    private var accountDetailsButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Account Details", for: .normal)
        button.addTarget(self, action: #selector(self.accountDetailsButtonAction), for: .touchUpInside)
        button.center = view.center
        return button
    }

    required init(viewModel: VMProtocol) {
        self.accountsVM = viewModel as? AccountsVMProtocol
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
        self.title = "Accounts"
        view.backgroundColor = .systemRed
        view.addSubview(accountDetailsButton)
    }
    
    // MARK: Actions
    @objc private func accountDetailsButtonAction() {
        accountsVM?.goToAccountDetails()
    }
}
