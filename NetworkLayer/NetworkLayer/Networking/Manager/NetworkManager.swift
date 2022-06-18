//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

// MARK: - EXAMPLE FILE

import Foundation

// Мы используем это перечисление при обработке ответов на запросы и будем выводить соответствующее сообщение.

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be auth first"
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "We could not decode the response"
}

// Мы используем Result для того чтобы определить был ли запрос успешен, либо же нет. Если нет, то вернем сообщение об ошибке с причиной.

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let MovieAPIKey = "YOUR_API_KEY"
    private let router = Router<MovieApi>()
    
    // Мы определяем метод getNewMovies с двумя аргументами: номер страницы пагинации и completion handler, который возвращает опциональный массив моделей Movie, либо опциональную ошибку.

    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?,_ error: String?)->()){
       //Вызываем Router. Передаем номер страницы и обрабатываем completion в замыкании.
        router.request(.newMovies(page: page)) { data, response, error in
            // URLSession возвращает ошибку если нет сети или не получилось сделать запрос по какой-либо причине. Обратите внимание, что это не ошибка API, такие ошибки происходят на клиенте и происходят обычно из-за плохого качества интернет-соединения.
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            // Нам необходимо привести наш response к HTTPURLResponse, потому что нам надо получить доступ к свойству statusCode.
            if let response = response as? HTTPURLResponse {
                //  Объявляем result и инициализируем его с помощью метода handleNetworkResponse
                let result = self.handleNetworkResponse(response)
                switch result {
                    // Success означает что запрос прошел успешно и мы получили ожидаемый ответ. Затем мы проверяем, пришли ли с ответом данные, и если нет, то просто завершаем метод через return.
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    // Если же ответ приходит с данными, то необходимо распарсить полученные данные в модель. После этого передаем полученный массив моделей в completion.
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                        completion(apiResponse.movies,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    // В случае ошибки просто передаем ошибку в completion.
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
