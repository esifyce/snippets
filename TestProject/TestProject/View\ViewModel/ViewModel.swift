//
//  NetworkRequests.swift
//  TestProject
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

protocol ViewModelProtocol {
    
    func postRequest(completion: @escaping (Bool, AccessToken?, String?) -> ())
}
                
class ViewModel: ViewModelProtocol {
    
    let networkService: NetworkService = NetworkService.shared
    let email: String = "myrzaev.qs@gmail.com"
    let password: String = "SK123123"
    
    

    func getData() -> Data {
        let userDefaultsService = UserDefaultsService()
        let uid = userDefaultsService.getByKey(key: .UID)
        
        
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
                completion(true, nil, nil)
                    print("Плохооо")
                case .unauthorized(_):
                completion(true, nil, nil)
                    print("Ошибкааа")
                case .failure(let error):
                    print("АААААААА \(error)")
                completion(true, nil, nil)
            }
        }
    }
}

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
