//
//  ProResult.swift
//  cms
//
//  Created by Фатихсултан Жакшылыков on 12/3/21.
//

import Foundation

enum ProResult<Success> {
    case success(Success)
    case badRequest(FailureModel)
    case unauthorized(String)
    case failure(String)
}
