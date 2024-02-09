//
//  Redux.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 09.02.2024.
//

import Foundation
import SwiftUI

protocol ReduxAction {}

protocol ReduxState {}

protocol ReduxStore: ObservableObject {
    var state: ReduxState { get }
    
    func dispatch(_ currentState: ReduxState, _ action: ReduxAction)
}


typealias Reducer<AppState> = (AppState, ReduxAction) -> AppState

final class Store<AppState>: ObservableObject {
    @Published private(set) var currentState: AppState
    
    private let reducer: Reducer<AppState>
    
    init(
        initialState: AppState,
        reducer: @escaping Reducer<AppState>
    ) {
        self.currentState = initialState
        self.reducer = reducer
    }
    
    func dispatch(_ action: ReduxAction) {
        self.dispatch(self.currentState, action)
    }
    
    
    private func dispatch(_ state: AppState, _ action: ReduxAction) {
        let newState = reducer(currentState, action)
        
        currentState = newState
    }
}
