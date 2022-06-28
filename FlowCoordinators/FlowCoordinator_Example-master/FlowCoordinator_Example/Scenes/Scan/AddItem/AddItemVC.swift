//
//  AddItemVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/10/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController, VCProtocol {
    var addItemVM: AddItemVMProtocol?

    required init(viewModel: VMProtocol) {
        self.addItemVM = viewModel as? AddItemVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        self.title = "Add Item"
    }
}
