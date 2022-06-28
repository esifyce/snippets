//
//  ScanVC.swift
//  FlowCoordinator_Example
//
//  Created by Franks,Kent on 1/9/20.
//  Copyright © 2020 Kefbytes LLC. All rights reserved.
//

import UIKit

class ScanVC: UIViewController, VCProtocol {
    var scanVM: ScanVMProtocol?

    required init(viewModel: VMProtocol) {
        self.scanVM = viewModel as? ScanVMProtocol
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupScanButton()
    }

    private func setupScanButton() {
        let scanButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        scanButton.center = view.center
        scanButton.setTitle("Scan", for: .normal)
        scanButton.addTarget(self, action: #selector(self.scanAction), for: .touchUpInside)
        view.addSubview(scanButton)
    }

    // MARK: Actions
    @objc private func scanAction() {
        scanVM?.scanComplete()
    }
}
