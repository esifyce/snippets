//
//  ViewController.swift
//  TestProject
//
//  Created by Krasivo on 06.07.2022.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    let viewModel: ViewModelProtocol
    
    // MARK: - Views
    
    let button: UIButton = {
        let vw = UIButton()
        vw.setTitle("GET DATA", for: .normal)
        return vw
    }()
    
    // MARK: - Init
    
    init(viewModel: ViewModelProtocol = ViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        view.addSubview(button)
        button.snp.makeConstraints { $0.center.equalToSuperview() }
        button.addTarget(self, action: #selector(fuckShit), for: .touchUpInside)
        
        
    }
    
    /*  @objc func bullShit() {
     let session = URLSession.shared
     let url = "https://med-tech.herokuapp.com/patient/login/"
     let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
     request.httpMethod = "POST"
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     let params: [String: Encodable]? = ["email" : "myrzaev.qs@gmail.com", "password" : "SK123123"]
     do {
     request.httpBody = try JSONSerialization.data(withJSONObject: params ?? [:], options: JSONSerialization.WritingOptions())
     
     let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
     if let response = response {
     let nsHTTPResponse = response as! HTTPURLResponse
     let statusCode = nsHTTPResponse.statusCode
     print ("status code = \(statusCode)")
     }
     if let error = error {
     print ("\(error)")
     }
     if let data = data {
     do{
     let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
     if let parseJSON = jsonResponse {
     let accessToken = AccessToken(token: parseJSON["access_token"] as? String ?? "")
     
     print("JWTDecoder start")
     let dict = self.decode(jwtToken: accessToken.token)
     // print(dict)
     print("JWTDecoder finish")
     
     }
     
     } catch _ {
     print ("OOps not good JSON formatted response")
     }
     }
     })
     task.resume()
     } catch _ {
     print ("Oops something happened buddy")
     }
     } */
    
    @objc func fuckShit() {
        viewModel.postRequest {[weak self] success, model, error in
            let token = model?.accessToken as? String ?? ""
            
            guard let encrtyptToken = self?.viewModel.jsonDecoding(accessToken: token) else { return }
            print(encrtyptToken)
            let jsonData = Data(encrtyptToken.utf8)
            let userModel = try! JSONDecoder().decode(Welcome.self, from: jsonData)
            print(userModel)
            
        }
    }
}



//struct AccessToken: Codable {
//    let token: String
//}
//

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: true) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
