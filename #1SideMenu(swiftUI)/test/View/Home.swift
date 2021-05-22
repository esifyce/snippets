//
//  Home.swift
//  test
//
//  Created by Sabir Myrzaev on 22.05.2021.
//  Copyright © 2021 Sabir. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    //Hidding tab
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @ObservedObject var menuData = MenuModel()
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Drawer()
            
            // main view
            
            TabView(selection: $menuData.selectedMenu) {
                
                Catalogue()
                .tag("Catalogue")
                
                Orders()
                .tag("Your Orders")
                
                Cart()
                .tag("Your Cart")
                
                Favourites()
                .tag("Favourites")
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        // Max frame
            .frame(width: UIScreen.main.bounds.width)
        // Moving View
            .offset(x: menuData.showDrawer ? 125 : -125)
            .overlay(
                
                ZStack {
                    
                    if !menuData.showDrawer {
                        
                    DrawerCloseButton()
                        .padding()
                    }
                },
                alignment: .topLeading
            )
        
            .environmentObject(menuData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

