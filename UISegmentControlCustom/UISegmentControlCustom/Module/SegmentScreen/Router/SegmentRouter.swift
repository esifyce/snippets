//
//  SegmentRouter.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol SegmentRouterProtocol: AnyObject {
    
}

final class SegmentRouter {
    weak var view: UIViewController?
}

extension SegmentRouter: SegmentRouterProtocol {
    
}
