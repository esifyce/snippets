//
//  MenuModel.swift
//  test
//
//  Created by Sabir Myrzaev on 22.05.2021.
//  Copyright © 2021 Sabir. All rights reserved.
//

import SwiftUI

class MenuModel: ObservableObject {
    
    // default
    @Published var selectedMenu = "Catalogue"
    
    // show
    @Published var showDrawer = false
}

