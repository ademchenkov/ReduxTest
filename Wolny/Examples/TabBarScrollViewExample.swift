//
//  TabBarScrollViewExample.swift
//  Wolny
//
//  Created by Anton Demchenkov on 28.03.2024.
//

import SwiftUI

struct TabBarScrollViewExample: View {
    
    let tabs: [TabBarItem] = [
        .home,
        .catalog,
        .account,
        .bag
    ]
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        
        let tabBarOffSet = scrollViewOffset - 73
        
        VStack(spacing: 0) {
            ScrollView {
                Text("")
                contentLayer
                    .onScrollViewOffsetChanged { value in
                        self.scrollViewOffset = value
                    }
            }
            .padding(.bottom, tabBarOffSet)
            CustomTabBarView(tabs: tabs)
                .offset(
                    y:scrollViewOffset > 73 ? 0 :(scrollViewOffset > 0 ? (73 - scrollViewOffset) : 73)
                )
        }
    }
}

extension TabBarScrollViewExample {
    
    private var contentLayer: some View {
        ForEach(0..<10) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.3))
                .frame(width: 300, height: 300)
        }
    }
    
}

#Preview {
    TabBarScrollViewExample()
}
