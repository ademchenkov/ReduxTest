//
//  AppState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct AppState: ReduxState {
    let test1Screen: Test1ScreenState
    let test2Screen: Test2ScreenState
}

extension AppState {
    init() {
        test1Screen = Test1ScreenState()
        test2Screen = Test2ScreenState()
    }
}

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            test1Screen: Test1ScreenState.reducer(state.test1Screen, action),
            test2Screen: Test2ScreenState.reducer(state.test2Screen, action)
        )
    }
}
