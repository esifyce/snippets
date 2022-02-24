//
//  InstrumentViewController.swift
//  BipolarTest
//
//  Created by Sabir Myrzaev on 04.07.2021.
//

import UIKit

class InstrumentViewController: UITableViewController {
    @IBOutlet var mySettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySettingTableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(indexPath.section)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
