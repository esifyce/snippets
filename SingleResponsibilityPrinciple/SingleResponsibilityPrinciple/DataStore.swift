//
//  DataStore.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sabir Myrzaev on 09.07.2021.
//

import Foundation

class DataStore {
    
    // MARK: - Data storage
    
    // сохранение данных в кеш/бд
    func savenameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    // получать данные из кеша/бд
    func getNameFromCache() -> String {
        return "some name"
    }
}
