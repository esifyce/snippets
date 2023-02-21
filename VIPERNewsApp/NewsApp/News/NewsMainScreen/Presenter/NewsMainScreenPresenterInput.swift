//
//  NewsMainScreenPresenterInput.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsMainScreenPresenterInput: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func refreshData()
    var startIndicator: () -> Void { get set }
    var stopIndicator: () -> Void { get set }
}
