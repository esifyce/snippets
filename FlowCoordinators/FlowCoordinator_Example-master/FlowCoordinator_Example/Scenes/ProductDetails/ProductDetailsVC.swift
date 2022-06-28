//
//  ProductDetailsVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    var productDetailsVM: ProductDetailsVMProtocol?

    init(viewModel: ProductDetailsVMProtocol) {
        self.productDetailsVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.title = "Product Details"
    }
}
