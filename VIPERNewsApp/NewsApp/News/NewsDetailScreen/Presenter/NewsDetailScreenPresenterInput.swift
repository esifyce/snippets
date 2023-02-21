//
//  NewsDetailScreenPresenterInput.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import Foundation

protocol NewsDetailScreenPresenterInput: AnyObject {
    func viewDidLoad()
    var startIndicator: () -> Void { get set }
    var stopIndicator: () -> Void { get set }
}
