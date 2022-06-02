//
//  Coordinator.swift
//  v1-Coordinator
//
//  Created by Krasivo on 01.06.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
