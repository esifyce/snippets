//
//  NetworkErrorViewController.swift
//  BipolarOnboard
//
//  Created by Sabir Myrzaev on 28.06.2021.
//

import UIKit

class NetworkErrorViewController: UIViewController {
//    let reachability = try! Reachability()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    func networkProblem() {
//        DispatchQueue.main.async {
//            self.reachability.whenReachable = { reachability in
//                if reachability.connection == .wifi {
//                    print("Reachable via WiFi")
//                } else {
//                    print("Reachable via Cellular")
//                }
//                self.view.window?.rootViewController?.dismiss(animated: true)
//            }
//            self.reachability.whenUnreachable = { _ in
//                print("Not reachable")
//                if let networkVC = self.storyboard?.instantiateViewController(identifier: "NetworkErrorViewController") as? NetworkErrorViewController {
//                    self.present(networkVC, animated: true)
//                }
//            }
//            
//            do {
//                try self.reachability.startNotifier()
//            } catch {
//                print("Unable to start notifier")
//            }
//        }
//    }
//    
//    deinit {
//        reachability.stopNotifier()
//    }
}
