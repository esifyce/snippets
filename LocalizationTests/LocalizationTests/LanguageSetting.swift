//
//  LanguageSetting.swift
//  LocalizationTests
//
//  Created by Krasivo on 23.05.2024.
//

import SwiftUI

enum Language: String, CaseIterable {
    case english, russian
    
    var code: String {
        switch self {
        case .english:
            "en"
        case .russian:
            "ru"
        }
    }
}

@Observable
class LanguageSetting {
    var locale = Locale(identifier: UserDefaults.standard.string(forKey: "language") ?? "en")
    
    var selected: Language {
        set {
            UserDefaults.standard.set([newValue.code], forKey: "AppleLanguages")
            UserDefaults.standard.set(newValue.rawValue, forKey: "language")
        }
        get {
            return Language(rawValue: UserDefaults.standard.string(forKey: "language") ?? "") ?? .english
        }
    }
}
