//
//  AboutAssembly.swift
//  UIAboutControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

final class AboutAssembly {
    
}

extension AboutAssembly {
    static func assembly(tapSegment: @escaping (UISegmentedControl) -> Void) -> UIViewController {
        let router = AboutRouter()
        let interactor = AboutInteractor()
        let presenter = AboutPresenter(interactor: interactor, router: router)
        let viewController = AboutViewController(presenter: presenter, tapSegment: tapSegment)
        
        router.view = viewController
        
        return viewController
    }
}
