//
//  AccountScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct AccountScreenView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var body: some View {
        VStack {
            let state = store.currentState.accountScreen
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
    return AccountScreenView().environmentObject(store)
}

#Preview {
    AccountScreenView()
}
