//
//  NetworkRequests.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

protocol ViewModelProtocol {
    
    func postRequest(completion: @escaping (Bool, AccessToken?, String?) -> ())
    func jsonDecoding(accessToken: String?) -> String?
}
                
class ViewModel: ViewModelProtocol {
    
    var accessToken: String?
    
    let jwtConverter: JWTConverter = JWTConverter.shared
    
    let networkService: NetworkService = NetworkService.shared
    let email: String = "myrzaev.qs@gmail.com"
    let password: String = "SK123123"
    
    
    func jsonDecoding(accessToken: String?) -> String? {
        guard let accessToken = accessToken else { return nil }
        return jwtConverter.decode(jwtToken: accessToken)
    }
    
    func getData() -> Data {
        let object = EnterLogin(email: email, password: password)
        print(object)
        return object.toJSONData() ?? Data()
    }
    
    func postRequest(completion: @escaping (Bool, AccessToken?, String?) -> ()) {
        
        networkService.sendRequest(
            urlRequest: PostRouter.login(data: getData()).createURLRequest(),
            successModel: AccessToken.self)
        { [weak self] (result) in
            guard self != nil else {return}
            switch result {
                case .success(let model):
                    completion(true, model, nil)
                    debugPrint(#function)
                case .badRequest(_):
                completion(false, nil, nil)
                    print("Плохооо")
                case .unauthorized(_):
                completion(false, nil, nil)
                    print("Ошибкааа")
                case .failure(let error):
                    print("АААААААА \(error)")
                completion(false, nil, nil)
            case .internalServerError(_):
                print("internal Server")
                completion(false, nil, nil)
            case .notImplemented(_):
                print("notImplemented")
                completion(false, nil, nil)
            }
        }
    }
}

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
