//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sabir Myrzaev on 09.07.2021.
//

import UIKit


// MARK: - Welcome
struct Country: Codable {
    let Id: String
    let Time: String
    let Name: String
    let Image: String?
}

class ViewController: UIViewController {

    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    var networkService = NetworkService()
    let dataStore = DataStore()
    
    // MARK: - Outlets
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        networkService.dataFetcher(urlString: urlString)
    }

    // MARK: - Business logic
    
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.savenameInCache(name: name)
    }
    
    // MARK: - User Interface
    
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "Empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
}

