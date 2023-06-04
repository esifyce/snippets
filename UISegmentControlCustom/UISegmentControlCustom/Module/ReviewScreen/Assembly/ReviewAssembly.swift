//
//  ReviewAssembly.swift
//  UIReviewControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

final class ReviewAssembly {
    
}

extension ReviewAssembly {
    static func assembly(tapSegment: @escaping (UISegmentedControl) -> Void) -> UIViewController {
        let router = ReviewRouter()
        let interactor = ReviewInteractor()
        let presenter = ReviewPresenter(interactor: interactor, router: router)
        let viewController = ReviewViewController(presenter: presenter, tapSegment: tapSegment)
        
        router.view = viewController
        
        return viewController
    }
}
