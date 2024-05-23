//
//  LocalizationTestsApp.swift
//  LocalizationTests
//
//  Created by Krasivo on 23.05.2024.
//

import SwiftUI

@main
struct LocalizationTestsApp: App {
    @State var languageSettings = LanguageSetting()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(languageSettings)
                .environment(\.locale, languageSettings.locale)
        }
    }
}
