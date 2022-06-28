//
//  OrderDetailsVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class OrderDetailsVC: UIViewController, VCProtocol {
    var orderDetailsVM: OrderDetailsVMProtocol?

    required init(viewModel: VMProtocol) {
        self.orderDetailsVM = viewModel as? OrderDetailsVMProtocol
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
        self.title = "Order Details"
        view.backgroundColor = .orange
    }
}
