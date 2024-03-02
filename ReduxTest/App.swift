//
//  ReduxTestApp.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 09.02.2024.
//

import SwiftUI

@main
struct ReduxTestApp: App {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    
    var body: some Scene {
        WindowGroup {
            AppTapBarView()
                .environmentObject(store)
        }
    }
}
