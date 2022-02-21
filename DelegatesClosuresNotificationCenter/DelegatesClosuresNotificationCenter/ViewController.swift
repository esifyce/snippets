//
//  ViewController.swift
//  DelegatesClosuresNotificationCenter
//
//  Created by Eduard Sinyakov on 4/11/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

protocol MatrixDelegate: AnyObject {
	func update(label text: String, image: UIImage?)
}

class ViewController: UIViewController {
	private let toSelect = "toSelect"

	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var label: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == toSelect {
			if let selectVC = segue.destination as? SelectViewController {
				selectVC.matrixDelegate = self
//				selectVC.completion = { [weak self] text, image in
//					guard let self = self else { return }
//					self.mainImage.image = image
//					self.label.isHidden = false
//					self.label.text = text
//				}
			}
		}
	}


}

extension ViewController: MatrixDelegate {
	func update(label text: String, image: UIImage?) {
		mainImage.image = image
		label.isHidden = false
		label.text = text
	}
}
