//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import Foundation

// Также может оказаться полезным выдавать не стандартные ошибки, а кастомизированные. Всегда довольно трудно расшифровать то, что вам выдает Xcode.
public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding failed"
    case missingURL = "URL is nil"
}
