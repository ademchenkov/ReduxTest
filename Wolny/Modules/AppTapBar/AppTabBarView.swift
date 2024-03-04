//
//  AppTabBarView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import SwiftUI

struct AppTabBarView: View {
    @EnvironmentObject var store: Store<AppState>
    
 //   @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            HomeScreenView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            CatalogScreenView()
                .tabBarItem(tab: .catalog, selection: $tabSelection)
            AccountScreenView()
                .tabBarItem(tab: .account, selection: $tabSelection)
            BagScreenView()
                .tabBarItem(tab: .bag, selection: $tabSelection)
        }
        .onChange(of: tabSelection) {
            store.dispatch(AppTapBarStateAction.selectTab(tab: tabSelection))
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
