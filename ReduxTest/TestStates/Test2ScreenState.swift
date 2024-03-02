//
//  ProfileScreenState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct Test2ScreenState: ReduxState, Codable {
    let userName: String
    let email: String
}

extension Test2ScreenState {
    init() {
        userName = "IVAN PETROV"
        email = "ivan.petrov@test.test"
    }
}

enum Test2ScreenStateAction: ReduxAction {
    case setProfile(userName: String, email: String)
}

extension Test2ScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case Test2ScreenStateAction.setProfile(let userName, let email):
            return Test2ScreenState(
                userName: userName,
                email: email
            )
        default:
            return state
        }
    }
}
