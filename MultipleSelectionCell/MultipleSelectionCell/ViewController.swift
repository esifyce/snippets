//
//  ViewController.swift
//  MultipleSelectionCell
//
//  Created by Sabir Myrzaev on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var crickerName = ["Vira Kohli", "Alogo Piso", "Suk Suk", "Vak Sak", "Alam Balam", "Vana FSA", "CKD dSS", "Copa Mona", "Loko Voko", "Toko Soko", "Mono Type", "Vina San","Loa San" ,"Kona Han"]
    
    var items = [String]()
    var term: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        items.removeAll()
        if let selectedRows = myTableView.indexPathsForSelectedRows {
            for indexpath in selectedRows {
                items.append(crickerName[indexpath.row])
            }
            print("----You have selected items----")
            for item in items {
                    term = item
                }
            print(term)
            
    
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crickerName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = crickerName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
//        let selectedCell: UITableViewCell = myTableView.cellForRow(at: indexPath)!
//        selectedCell.contentView.backgroundColor = UIColor.green
    }
}
