//
//  ProfileScreenState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct AccountTabState: ReduxState, Codable {
    let userName: String
    let email: String
}

extension AccountTabState {
    init() {
        userName = "IVAN PETROV"
        email = "ivan.petrov@test.test"
    }
}

enum AccountTabStateAction: ReduxAction {
    case setProfile(userName: String, email: String)
}

extension AccountTabState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case AccountTabStateAction.setProfile(let userName, let email):
            return AccountTabState(
                userName: userName,
                email: email
            )
        default:
            return state
        }
    }
}
