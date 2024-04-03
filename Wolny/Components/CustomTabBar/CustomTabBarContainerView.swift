//
//  CustomTabBarContainerView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                content
            }
            CustomTabBarView(selection: $selection, tabs: tabs)
                .environment(\.colorScheme, .light)
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
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            HomeTabView()
        }
    }
}
