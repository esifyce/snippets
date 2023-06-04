//
//  AboutPresenter.swift
//  UIAboutControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import Foundation

protocol AboutPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class AboutPresenter {
    let interactor: AboutInteractorProtocol
    let router: AboutRouterProtocol
    weak var view: AboutViewControllerProtocol?
    
    init(interactor: AboutInteractorProtocol,
         router: AboutRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension AboutPresenter: AboutPresenterProtocol {
    func viewDidLoad() {
        
    }
}

private extension AboutPresenter {
    
}

extension AboutPresenter: AboutViewDelegate {
    func changedSwitchValue() {
        
    }
    
    
}
