//
//  GalleryPresenter.swift
//  UIGalleryControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import Foundation

protocol GalleryPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class GalleryPresenter {
    private let interactor: GalleryInteractorProtocol
    private let router: GalleryRouterProtocol
    private let collectionManager: GalleryCollectionManagerProtocol
    weak var view: GalleryViewControllerProtocol?
    
    init(interactor: GalleryInteractorProtocol,
         router: GalleryRouterProtocol,
         collectionManager: GalleryCollectionManagerProtocol) {
        self.interactor = interactor
        self.router = router
        self.collectionManager = collectionManager
    }
}

// MARK: - GalleryPresenterProtocol

extension GalleryPresenter: GalleryPresenterProtocol {
    func viewDidLoad() {
        interactor.getGalleryImage { viewModel in
            collectionManager.displayGallery(viewModel)
        }
    }
}

// MARK: - private GalleryPresenter

private extension GalleryPresenter {
    
}

// MARK: - GalleryViewDelegate

extension GalleryPresenter: GalleryViewDelegate {

}

// MARK: - GalleryCollectionManagerDelegate

extension GalleryPresenter: GalleryCollectionManagerDelegate {
    func didGalleryTap() {
        print("gallery")
    }
}
