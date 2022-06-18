//
//  ParameterEncoding.swift
//  NetworkLayer
//
//  Created by Krasivo on 18.06.2022.
//

import Foundation

// Создадим typealias для Parameters, это опять будет обычный словарь. 
public typealias Parameters = [String:Any]

// ParameterEncoder с единственной функцией encode. У метода encode есть два параметра: inout URLRequest и Parameters. INOUT это ключевое слово в Swift, которое определяет параметр функции как ссылку.
// Протокол ParameterEncoder будет реализовываться в JSONParameterEncoder и в URLPameterEncoder.
// ParameterEncoder содержит единственную функцию, задача которой кодировать параметры. Этот метод может выдавать ошибку, которую необходимо обрабатывать, поэтому мы используем throw.
public protocol ParameterEncoder {
 static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
