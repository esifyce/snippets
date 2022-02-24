//
//  WalkthroughViewController.swift
//  MyLocations
//
//  Created by Sabir Myrzaev on 25.06.2021.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.masksToBounds = true
            nextButton.isHidden = true

        }
    }
    // MARK: - Properties
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)


    }
    
    // MARK: - Actions

    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalktrough")
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.isHidden = true
            case 2:
                nextButton.isHidden = false
            default:
                break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }


}
