//
//  CustomTabBarContainerView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    let content: Content
    
    @EnvironmentObject var store: Store<AppState>
    @State private var tabs: [TabBarItem] = []
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    let tabs: [TabBarItem] = [
        .home,
        .catalog,
        .account,
        .bag
    ]
    
    
    return VStack {
        CustomTabBarContainerView() {
            HomeTabView()
        }
    }
}
