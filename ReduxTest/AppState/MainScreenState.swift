//
//  MainScreenState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 20.02.2024.
//

import Foundation

enum Tab2 {
    case home
    case test1
    case test2
}

struct MainScreenState: ReduxState {
    let selectedTab: Tab2
}

extension MainScreenState {
    init() {
        selectedTab = .home
    }
}

enum MainScreenStateAction: ReduxAction {
    case selectTab(tab: Tab2)
}

extension MainScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case MainScreenStateAction.selectTab(let tab):
            return MainScreenState(
                selectedTab: tab
            )
        default:
            return state
        }
    }
}
