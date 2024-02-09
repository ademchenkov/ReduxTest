//
//  HomeScreenState.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 11.02.2024.
//

import Foundation

struct Test1ScreenState: ReduxState, Codable {
    let collectionName: String
    let collectionImage: String
}

extension Test1ScreenState {
    init() {
        collectionName = "TEST NAME 1"
        collectionImage = "TEST IMAGE 1"
    }
}

enum Test1ScreenStateAction: ReduxAction {
    case setCollectionName(name: String)
    case setCollectionImage(image: String)
}

extension Test1ScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case Test1ScreenStateAction.setCollectionName(let name):
            return Test1ScreenState(
                collectionName: name,
                collectionImage: state.collectionImage
            )
        case Test1ScreenStateAction.setCollectionImage(let image):
            return Test1ScreenState(
                collectionName: state.collectionName,
                collectionImage: image
            )
        default:
            return state
        }
    }
}
