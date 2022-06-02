//
//  MainViewController.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

class MainViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var helloUser: UILabel!
    
    weak var coordinator: AppCoordinator?
    var viewModel:  MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        helloUser.text = "Hello \(viewModel?.login ?? "")"
    }
    
    @IBAction func nextAboutButton(_ sender: UIButton) {
        coordinator?.showDetail()
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
