//
//  ReviewPresenter.swift
//  UIReviewControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import Foundation

protocol ReviewPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class ReviewPresenter {
    let interactor: ReviewInteractorProtocol
    let router: ReviewRouterProtocol
    weak var view: ReviewViewControllerProtocol?
    
    init(interactor: ReviewInteractorProtocol,
         router: ReviewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ReviewPresenter: ReviewPresenterProtocol {
    func viewDidLoad() {
        
    }
}

private extension ReviewPresenter {
    
}

extension ReviewPresenter: ReviewViewDelegate {
 
    
}
