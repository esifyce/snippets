//
//  ViewController.swift
//  bottom-sheet-dialog
//
//  Created by krasivo on 04/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openDialogPressed(_ sender: Any) {
        let dialog = BottomSheetViewController()
        dialog.modalPresentationStyle = .overCurrentContext
        self.present(dialog, animated: false)
    }
}

