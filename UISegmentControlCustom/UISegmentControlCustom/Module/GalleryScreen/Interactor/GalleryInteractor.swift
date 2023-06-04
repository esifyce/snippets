//
//  GalleryInteractor.swift
//  UIGalleryControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import Foundation

protocol GalleryInteractorProtocol: AnyObject {
    func getGalleryImage(callback: ([GalleryViewModel]) -> Void)
}

final class GalleryInteractor {
    lazy var listGalleryImage: [GalleryViewModel] = [
        .init(image: "1"),
        .init(image: "2"),
        .init(image: "3"),
        .init(image: "4"),
        .init(image: "5")
    ]
}

extension GalleryInteractor: GalleryInteractorProtocol {
    func getGalleryImage(callback: ([GalleryViewModel]) -> Void) {
        callback(listGalleryImage)
    }
}
