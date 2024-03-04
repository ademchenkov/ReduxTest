//
//  ProfileView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 10.02.2024.
//

import SwiftUI

struct Test2ScreenView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var body: some View {
        VStack {
            let state = store.currentState.test2Screen
            Text("User name: \(state.userName)")
            Text("E-mail: \(state.email)")
        }
        .navigationTitle("Profile")
    }
}


#Preview {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    return Test2ScreenView().environmentObject(store)
}
