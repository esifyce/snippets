//
//  ProResult.swift
//  MedTech
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

enum ProResult<Success> {
    case success(Success)
    case badRequest(FailureModel)
    case unauthorized(String)
    case failure(String)
    case internalServerError(FailureModel)
    case notImplemented(FailureModel)
}
