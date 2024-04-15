//
//  AppTabBarView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import SwiftUI

struct AppTabBarView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var products: [Product] = mockProducts
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        
        CustomTabBarContainerView() {
            HomeTabView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            CatalogTabView(products: products)
                .tabBarItem(tab: .catalog, selection: $tabSelection)
            AccountTabView()
                .tabBarItem(tab: .account, selection: $tabSelection)
            BagTabView()
                .tabBarItem(tab: .bag, selection: $tabSelection)
        }
        .onChange(of: store.currentState.appTapBar.tabSelection) { _, newValue in
            tabSelection = newValue
            print("AppTabBarState selectedTab :\(store.currentState.appTapBar.tabSelection)")
        }
        .onChange(of: tabSelection) { _, newValue in
            store.dispatch(AppTapBarStateAction.selectTab(tab: newValue))
            print("AppTabBarState selectedTab :\(store.currentState.appTapBar.tabSelection)")
        }
    }
}

#Preview {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    return AppTabBarView()
        .environmentObject(store)
}
