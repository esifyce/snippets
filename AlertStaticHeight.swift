//
//  ViewController.swift
//  Practice
//
//  Created by Krasivo on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let startAlertButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .cyan
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startAlertButton)
        
        NSLayoutConstraint.activate([
            startAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startAlertButton.widthAnchor.constraint(equalToConstant: 200),
            startAlertButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        startAlertButton.addTarget(self, action: #selector(bithesAlert), for: .touchUpInside)
    }

    @objc
    private func bithesAlert() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        for i in 0...20 {
            alert.addAction(UIAlertAction(title: "OK=\(i)", style: .default, handler: nil))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: .height, multiplier: 1, constant: self.view.frame.height * 0.40)
        alert.view.addConstraint(height)

        present(alert, animated: true, completion: {
            guard alert.view.subviews.count >= 1 else { return }
            guard alert.view.subviews[0].subviews.count >= 1 else { return }
            guard alert.view.subviews[0].subviews[0].subviews.count >= 2 else { return }
            guard alert.view.subviews[0].subviews[0].subviews[1].subviews.count >= 3 else { return }

            if let scrollView = alert.view.subviews[0].subviews[0].subviews[1].subviews[2] as? UIScrollView {
                scrollView.setContentOffset(.zero, animated: true)
            }
        })
    }
    
}

