//
//  PhaseViewController.swift
//  BipolarTest
//
//  Created by Sabir Myrzaev on 04.07.2021.
//

import UIKit

class PhaseViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var phaseTableView: UITableView!
    
    var item = [String]()
    var items = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"]
    
    // MARK: - VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phaseTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    // MARK: - Actions
    
    @IBAction func nextPhaseButton(_ sender: UIButton) {
        print("phase button success")
        determinateThePhases()
    }
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        print("done button success")
        determinateThePhases()
 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Helper methods
    
    func determinateThePhases() {
        item.removeAll()
        
        if let selectedRows = phaseTableView.indexPathsForSelectedRows {
            for sel in selectedRows {
                item.append(items[sel.row])
            }
            // Doctor episode
            if item.count >= 14 {
                performSegue(withIdentifier: "consultAtDoctor", sender: nil)
            }
            // Mixed episode
            else if item.contains("12") || item.contains("13") || item.contains("15") || item.count > 9 {
                performSegue(withIdentifier: "areYouMixed", sender: nil)
            }
            // Depression episode
            else if item.contains("5") || item.contains("6") || item.contains("7") || item.contains("8") ||
                    item.contains("9") || item.contains("10") || item.contains("11") || item.contains("14") || item.contains("16") &&
                    !item.contains("0") && !item.contains("1") && !item.contains("2") && !item.contains("3") && !item.contains("4") {
                performSegue(withIdentifier: "areYouDepressed", sender: nil)
            }
            // Mania episode
            else if item.contains("0") || item.contains("1") || item.contains("2") || item.contains("3") || item.contains("4") &&
                !item.contains("5"), !item.contains("6"), !item.contains("7"), !item.contains("8"), !item.contains("9"),
                !item.contains("10"), !item.contains("11"), !item.contains("12"), !item.contains("13"), !item.contains("14"),
                !item.contains("15"), !item.contains("16"), !item.contains("17") {
                performSegue(withIdentifier: "areYouMania", sender: nil)
            } else {
                performSegue(withIdentifier: "areYouMixed", sender: nil)
            }
        }
        // Remission episode
        if item.count == 0 {
            performSegue(withIdentifier: "areYouRemission", sender: nil)
            
        }
    }
}

