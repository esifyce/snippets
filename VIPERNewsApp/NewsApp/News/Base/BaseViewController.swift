//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            activityIndicator.backgroundColor = .clear
            activityIndicator.layer.cornerRadius = 6
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = .medium
            activityIndicator.color = .white
            activityIndicator.startAnimating()

            activityIndicator.tag = 100
            for subview in self.view.subviews {
                if subview.tag == 100 {
                    print("already added")
                    return
                }
            }

            self.view.addSubview(activityIndicator)
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            let activityIndicator = self.view.viewWithTag(100) as? UIActivityIndicatorView
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
        }
    }
}
