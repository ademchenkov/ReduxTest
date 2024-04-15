//
//  AppTabBarView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 26.02.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @Environment (\.colorScheme) var colorScheme
    
    let tabs: [TabBarItem]
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Spacer()
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
                Spacer()
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 4)
        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32, alignment: .top)
        .background(colorScheme == .light ? .white : Color(CustomColor.firmGray))
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut.speed(1.3)) {
            store.dispatch(AppTapBarStateAction.selectTab(tab: tab))
        }
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text(tab.title)
                .font(store.currentState.appTapBar.tabSelection == tab ? (CustomFont.activeTabItem) : (CustomFont.tabItem))
                .foregroundColor(colorScheme == .light ? CustomColor.firmGray : .white)
        }
        .padding(.top, 8)
        .padding(.bottom, 32)
        .frame(maxHeight: .infinity)
        .background(colorScheme == .light ? .white : CustomColor.firmGray)
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
        Spacer()
        CustomTabBarView(tabs: tabs)
    }
}
