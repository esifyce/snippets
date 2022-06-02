//
//  Coordinator.swift
//  v1-MVVM
//
//  Created by Krasivo on 02.06.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
