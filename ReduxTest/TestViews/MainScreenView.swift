//
//  MainScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 20.02.2024.
//

import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var store: Store<AppState>
    
    @State private var selectedTab: Tab2 = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Test1ScreenView()
                .tabItem {
                    Label("Test1", systemImage: "1.lane")
                }
            Test2ScreenView()
                .tabItem {
                    Label("Test2", systemImage: "2.lane")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
        .onChange(of: selectedTab) {
            store.dispatch(MainScreenStateAction.selectTab(tab: selectedTab))
        }
    }
}

#Preview {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    return MainScreenView()
        .environmentObject(store)
}
