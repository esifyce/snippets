//
//  MenuButton.swift
//  test
//
//  Created by Sabir Myrzaev on 22.05.2021.
//  Copyright © 2021 Sabir. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    
    var name: String
    var image: String
    @Binding var selectedMenu: String
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                self.selectedMenu = self.name
            }
        }) {
            HStack(spacing: 15) {
                
                Image(systemName: image)
                    .font(.headline)
                    .foregroundColor(selectedMenu == name ? .black : .white)
                
                Text(name)
                    .foregroundColor(selectedMenu == name ? .black : .white)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(width: 200, alignment: .leading)
            .background(Color.white.opacity(selectedMenu == name ? 1 : 0))
            .cornerRadius(10)
       
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
