//
//  SegmentAssembly.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

final class SegmentAssembly {
    
}

extension SegmentAssembly {
    static func assembly() -> UIViewController {
        let router = SegmentRouter()
        let interactor = SegmentInteractor()
        let presenter = SegmentPresenter(interactor: interactor, router: router)
        let viewController = SegmentViewController(presenter: presenter)
        
        router.view = viewController
        
        return viewController
    }
}
