//
//  SettingViewController.swift
//  BipolarOnboard
//
//  Created by Sabir Myrzaev on 28.06.2021.
//

import UIKit
//import Firebase

class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
//        do {
//            try Auth.auth().signOut()
//            self.dismiss(animated: true, completion: nil)
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
        print("Выход")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
