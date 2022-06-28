//
//  InventoryVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class InventoryVC: UIViewController, VCProtocol {
    var inventoryVM: InventoryVMProtocol?

    required init(viewModel: VMProtocol) {
        self.inventoryVM = viewModel as? InventoryVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        setupProductDetailsButton()
    }

    private func setupProductDetailsButton() {
        let setupProductDetailsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        setupProductDetailsButton.center = view.center
        setupProductDetailsButton.setTitle("Go to product details", for: .normal)
        setupProductDetailsButton.addTarget(self, action: #selector(self.productDetailsAction), for: .touchUpInside)
        view.addSubview(setupProductDetailsButton)
    }

    // MARK: Actions
    @objc private func productDetailsAction() {
        inventoryVM?.goToProductDetails()
    }
}
