//
//  NetworkService.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sabir Myrzaev on 09.07.2021.
//

import Foundation

class NetworkService {
    
    // MARK: - Networking
    
    func dataFetcher(urlString: String) {
        request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            print(response)
        }
    }
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}
