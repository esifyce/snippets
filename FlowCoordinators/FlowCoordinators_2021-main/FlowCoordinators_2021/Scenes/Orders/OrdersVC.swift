//
//  OrdersVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class OrdersVC: UIViewController, VCProtocol {
    var ordersVM: OrdersVMProtocol?
    
    private var orderDetailsButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Order Details", for: .normal)
        button.addTarget(self, action: #selector(self.orderDetailsButtonAction), for: .touchUpInside)
        button.center = view.center
        return button
    }

    required init(viewModel: VMProtocol) {
        self.ordersVM = viewModel as? OrdersVMProtocol
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
        self.title = "Orders"
        view.backgroundColor = .green
        view.addSubview(orderDetailsButton)
    }
    
    // MARK: Actions
    @objc private func orderDetailsButtonAction() {
        ordersVM?.goToOrderDetails()
    }
}
