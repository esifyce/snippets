//
//  ContentView.swift
//  LocalizationTests
//
//  Created by Krasivo on 23.05.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(LanguageSetting.self) var languageSettings
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("hello-world")
            
            Button(action: {
                languageSettings.locale = Locale(identifier: "en")
                languageSettings.selected = .english
            }, label: {
                Text("EN Change")
            })
            
            Button(action: {
                languageSettings.locale = Locale(identifier: "ru")
                languageSettings.selected = .russian
            }, label: {
                Text("RU Change")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
