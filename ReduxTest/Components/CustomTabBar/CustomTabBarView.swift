//
//  AppTabBarView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 26.02.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Spacer()
                tabView(tab: tab)
                Spacer()
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .top)
        .background(Color(red: 0.35, green: 0.34, blue: 0.34))
        
        .overlay(
            Rectangle()
                .inset(by: 0.25)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text(tab.title)
                .font(TabBarStyle.font)
                .foregroundColor(TabBarStyle.textColor)
        }
        .padding(.vertical, 8)
        .background(TabBarStyle.backgroundColor)
    }
}
    
struct TabBarItem: Hashable {
    let title: String
}
    
struct TabBarStyle {
    static let textColor: Color = .white
    static let backgroundColor: Color = .firmGray
    static let font: Font = .custom("Manrope", size: 14)
}

#Preview {
    let tabs: [TabBarItem] = [
        TabBarItem(title: "HOME"),
        TabBarItem(title: "CATALOG"),
        TabBarItem(title: "ACCOUNT"),
        TabBarItem(title: "BAG")
    ]
    
    return CustomTabBarView(tabs: tabs)
}
