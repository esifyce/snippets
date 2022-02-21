//
//  SelectViewController.swift
//  DelegatesClosuresNotificationCenter
//
//  Created by Eduard Sinyakov on 4/11/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

	private let neo = UIImage(named: "neo")
	private let agentSmith = UIImage(named: "agentSmith")
	private let trueText = "Вы узнали правду"
	private let falseText = "Вы не узнали правду"

	//var completion: ((String, UIImage?) -> ())?
	weak var matrixDelegate: MatrixDelegate?

	@IBOutlet weak var blueButton: UIButton!
	@IBOutlet weak var redButton: UIButton!

	@IBAction func blueTapped(_ sender: UIButton) {
		//completion?(falseText, agentSmith)
		matrixDelegate?.update(label: falseText, image: agentSmith)
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction func redTapped(_ sender: UIButton) {
		//completion?(trueText, neo)
		matrixDelegate?.update(label: trueText, image: neo)
		self.dismiss(animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setup(button: blueButton)
		setup(button: redButton)
    }

	func setup(button: UIButton) {
		button.layer.cornerRadius = 30
		button.layer.borderWidth = 10
		button.layer.borderColor = UIColor.clear.cgColor
	}
}
