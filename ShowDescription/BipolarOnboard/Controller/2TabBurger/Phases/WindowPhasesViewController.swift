//
//  WindowPhasesViewController.swift
//  BipolarTest
//
//  Created by Sabir Myrzaev on 06.07.2021.
//

import UIKit

class WindowPhasesViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 15
                
                let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
                gestureRecognizer.cancelsTouchesInView = false
                gestureRecognizer.delegate = self
                view.addGestureRecognizer(gestureRecognizer)
        
        closeButton.isHidden = true
        
    }
    
    // MARK: - Actions
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - GestureRecognizer delegate
extension WindowPhasesViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return(touch.view === self.view)
    }
}
