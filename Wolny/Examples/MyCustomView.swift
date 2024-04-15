//
//  MyCustomView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 01.04.2024.
//

import SwiftUI

struct MyCustomView: View {

    let tabs: [TabBarItem] = [
        .home,
        .catalog,
        .account,
        .bag
    ]
    
    
    var body: some View {
        CustomTabBarContainerView() {
            AppNavBarView()
        }    }
}





#Preview {
    MyCustomView()
}
