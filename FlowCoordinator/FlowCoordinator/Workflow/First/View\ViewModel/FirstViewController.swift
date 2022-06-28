//
//  FirstViewController.swift
//  FlowCoordinator
//
//  Created by Krasivo on 28.06.2022.
//

import UIKit

class FirstViewController: UIViewController, CoordinatorViewControllerProtocol {
    var firstViewModelProtocol: FirstViewModelProtocol?
    
    required init(viewModel: CoordinatorViewModelProtocol) {
        self.firstViewModelProtocol = viewModel as? FirstViewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
}
