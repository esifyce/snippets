//
//  Storyboardable.swift
//  v1-Coordinator
//
//  Created by Krasivo on 02.06.2022.
//

import UIKit

protocol Storyboardable {
    // каждый раз вызывая функцию в качестве передаваемого возращаемого значения выступает объект в котором мы вызываем эту функцию, для передачи в координаторе наших контроллеров
    static func createObject() -> Self
}

extension Storyboardable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
