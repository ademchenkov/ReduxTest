//
//  AppTabBarState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import Foundation

struct AppTapBarState: ReduxState {
    let tabSelection: TabBarItem
}

extension AppTapBarState {
    init() {
        tabSelection = .home
    }
}

extension AppTapBarState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case AppTapBarStateAction.selectTab(let tab):
            return AppTapBarState(
                tabSelection: tab
            )
        default:
            return state
        }
    }
}
