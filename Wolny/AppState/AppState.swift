//
//  AppState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct AppState: ReduxState {
    let appTapBar: AppTapBarState
    let accountScreen: AccountTabState
}

extension AppState {
    init() {
        appTapBar = AppTapBarState()
        accountScreen = AccountTabState()
    }
}

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            appTapBar: AppTapBarState.reducer(state.appTapBar, action),
            accountScreen: AccountTabState.reducer(state.accountScreen, action)
        )
    }
}
