//
//  SegmentPresenter.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import Foundation

protocol SegmentPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class SegmentPresenter {
    let interactor: SegmentInteractorProtocol
    let router: SegmentRouterProtocol
    weak var view: SegmentViewControllerProtocol?
    
    init(interactor: SegmentInteractorProtocol,
         router: SegmentRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SegmentPresenter: SegmentPresenterProtocol {
    func viewDidLoad() {
        
    }
}

private extension SegmentPresenter {
    
}
