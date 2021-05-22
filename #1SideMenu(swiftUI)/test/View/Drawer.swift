//
//  Drawer.swift
//  test
//
//  Created by Sabir Myrzaev on 22.05.2021.
//  Copyright © 2021 Sabir. All rights reserved.
//

import SwiftUI

struct Drawer: View {
    
    @EnvironmentObject var menuData: MenuModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Spacer()
                
                // Close Button
                if menuData.showDrawer {
                DrawerCloseButton()
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Добре пажонте!")
                    .font(.headline)
                Text("Sabir Myrzaev")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 5)
            
            // menu Buttons
            
            VStack(spacing: 22) {
                
                MenuButton(name: "Catalogue", image: "envelope.fill", selectedMenu: $menuData.selectedMenu)
                
                MenuButton(name: "Your Orders", image: "bag.fill", selectedMenu: $menuData.selectedMenu)
                
                MenuButton(name: "Your Cart", image: "suit.heart.fill", selectedMenu: $menuData.selectedMenu)
                
                MenuButton(name: "Favourites", image: "line.horizontal.3", selectedMenu: $menuData.selectedMenu)
                
            }
            .padding(.leading)
            .frame(width: 250, alignment: .leading)
            .padding(.top, 30)
            
            Divider()
                .background(Color.white)
                .padding(.top, 30)
                .padding(.horizontal, 25)
            
            Spacer()
            
            MenuButton(name: "Sign Out", image: "rectangle", selectedMenu: .constant(""))

        }
            // Default Size
            .frame(width: 250)
            .background(
                (Color.gray).edgesIgnoringSafeArea(.vertical)
        )
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Close Buttons

struct DrawerCloseButton: View {
    
    @EnvironmentObject var menuData: MenuModel
    
    var body: some View {
        
        Button(action: {
            withAnimation(.easeInOut) {
                self.menuData.showDrawer.toggle()
            }
        }, label: {
                VStack(spacing: 5) {
                    
            Capsule()
                .fill(menuData.showDrawer ? Color.white : Color.primary)
                .frame(width: 35, height: 3)
                    .rotationEffect(.init(degrees: menuData.showDrawer ? -50 : 0))
                    // adjust like x
                .offset(x: menuData.showDrawer ? 2 : 0, y: menuData.showDrawer ? 9 : 0)
                    
                    VStack(spacing: 5) {
                        
                        Capsule()
                            .fill(menuData.showDrawer ? Color.white : Color.primary)
                            .frame(width: 35, height: 3)
                        
                        Capsule()
                            .fill(menuData.showDrawer ? Color.white : Color.primary)
                            .frame(width: 35, height: 3)
                        // Moving This View To Hide
                            .offset(y: menuData.showDrawer ? -8 : 0)
                }
                // Rotating Like Xmark
                        .rotationEffect(.init(degrees: menuData.showDrawer ? 50 : 0))
            }
        })
        // Making It Little Small
            .scaleEffect(0.8)
    }
}
