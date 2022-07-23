//
//  NetworkErrors.swift
//  MedTech
//
//  Created by Krasivo on 09.07.2022.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case methodNotAllowed
    case gone
    case unsupportedMediaType
    case internalServerError
    case notImplemented
    case serviceUnavailable
    case success
}
