//
//  JWTConverter.swift
//  TestProject
//
//  Created by Krasivo on 10.07.2022.
//

import Foundation

class JWTConverter {
    
    static let shared = JWTConverter()
    
    
    // MARK: - JWT
    
    func decode(jwtToken jwt: String) -> String {
      let segments = jwt.components(separatedBy: ".")
        
        return decodeJWTPart(segments[1]) ?? ""
    }

    func base64UrlDecode(_ value: String) -> Data? {
      var base64 = value
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")

      let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
      let requiredLength = 4 * ceil(length / 4.0)
      let paddingLength = requiredLength - length
      if paddingLength > 0 {
        let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
        base64 = base64 + padding
      }
      return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }

    func decodeJWTPart(_ value: String) -> String? {
        guard let bodyData = base64UrlDecode(value) else { return nil }
         let jsonText = String(data: bodyData, encoding: .utf8)!
    
        return jsonText
    }
    
}
