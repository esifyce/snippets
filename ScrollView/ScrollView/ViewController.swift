//
//  ViewController.swift
//  ScrollView
//
//  Created by Sabir Myrzaev on 19/4/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width,
                                      height: self.view.frame.height + 400)
    
    // MARK: - Views
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Center of container view"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }
    }


}

