//
//  AppState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct AppState: ReduxState {
    let appTapBar: AppTapBarState
    let accountScreen: AccountScreenState
    let test1Screen: Test1ScreenState
}

extension AppState {
    init() {
        appTapBar = AppTapBarState()
        accountScreen = AccountScreenState()
        test1Screen = Test1ScreenState()
    }
}

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            appTapBar: AppTapBarState.reducer(state.appTapBar, action),
            accountScreen: AccountScreenState.reducer(state.accountScreen, action),
            test1Screen: Test1ScreenState.reducer(state.test1Screen, action)
        )
    }
}
