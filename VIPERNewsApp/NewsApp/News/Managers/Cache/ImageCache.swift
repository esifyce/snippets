//
//  ImageCache.swift
//  NewsApp
//
//  Created by Krasivo on 05.02.2023.
//

import UIKit

class ImageCache {

    static let shared = ImageCache()

    private let cache = NSCache<NSURL, UIImage>()

    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: url as NSURL) {
            completion(image)
        } else {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }

                self?.cache.setObject(image, forKey: url as NSURL)
                completion(image)
            }

            task.resume()
        }
    }
}
