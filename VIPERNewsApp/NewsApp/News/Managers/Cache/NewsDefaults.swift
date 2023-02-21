//
//  NewsDefaults.swift
//  NewsApp
//
//  Created by Krasivo on 06.02.2023.
//

import Foundation


struct NewsDefaults {
    enum UserDefaultsKey: String {
        case token = "NewsDefaults.key.token"
        case eye = "NewsDefaults.key.eye"
    }
    
    init() {}

    // MARK: - Setup
    
    static func setupModule(token: String) {
        UserDefaults.standard.setValue(token, forKey: UserDefaultsKey.token.rawValue)
    }
    
    static func setupEye(eye: Int, title: String) {
        UserDefaults.standard.setValue(eye, forKey: UserDefaultsKey.eye.rawValue + title)
    }
    
    // MARK: - Obtain
    
    static func obtainToken() -> String {
        return UserDefaults.standard.string(forKey: UserDefaultsKey.token.rawValue) ?? ""
    }
    
    static func obtainEye(title: String) -> Int {
        return UserDefaults.standard.integer(forKey: UserDefaultsKey.eye.rawValue + title)
    }
}

final class JSONCache {

    static let shared = JSONCache()

    private let cache = UserDefaults.standard

    func json(for key: String, completion: @escaping (Any?) -> Void) {
        if let data = cache.data(forKey: key) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                completion(json)
            } catch {
                completion(nil)
            }
        } else {
            let task = URLSession.shared.dataTask(with: URL(string: key)!) { [weak self] data, response, error in
                guard let data = data else {
                    completion(nil)
                    return
                }

                self?.cache.set(data, forKey: key)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(json)
                } catch {
                    completion(nil)
                }
            }

            task.resume()
        }
    }
}
