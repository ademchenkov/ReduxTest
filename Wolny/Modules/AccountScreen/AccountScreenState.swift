//
//  ProfileScreenState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct AccountScreenState: ReduxState, Codable {
    let userName: String
    let email: String
}

extension AccountScreenState {
    init() {
        userName = "IVAN PETROV"
        email = "ivan.petrov@test.test"
    }
}

enum AccountScreenStateAction: ReduxAction {
    case setProfile(userName: String, email: String)
}

extension AccountScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case AccountScreenStateAction.setProfile(let userName, let email):
            return AccountScreenState(
                userName: userName,
                email: email
            )
        default:
            return state
        }
    }
}
