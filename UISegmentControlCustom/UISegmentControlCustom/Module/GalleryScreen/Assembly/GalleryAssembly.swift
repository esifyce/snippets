//
//  GalleryAssembly.swift
//  UIGalleryControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

final class GalleryAssembly {
    
}

extension GalleryAssembly {
    static func assembly(tapSegment: @escaping (UISegmentedControl) -> Void) -> UIViewController {
        let collectionManager: GalleryCollectionManagerProtocol = GalleryCollectionManager()
        let router = GalleryRouter()
        let interactor = GalleryInteractor()
        let presenter = GalleryPresenter(interactor: interactor,
                                         router: router,
                                         collectionManager: collectionManager)
        let viewController = GalleryViewController(presenter: presenter, tapSegment: tapSegment)
        collectionManager.injectCollection(viewController.galleryView.collectionView, delegate: presenter)
        router.view = viewController
        
        return viewController
    }
}
