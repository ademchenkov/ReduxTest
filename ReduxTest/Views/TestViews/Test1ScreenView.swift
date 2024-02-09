//
//  HomeView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 10.02.2024.
//

import SwiftUI

struct Test1ScreenView: View {
    @EnvironmentObject var store: Store<AppState>

    @State private var name: String = ""
    @State private var image: String = ""
    
    
    var body: some View {
        let state = store.currentState
        

        NavigationView {
            VStack {
                VStack {
                    Text("EDIT")
                        .font(.title2)
                    TextField("Collection name", text: $name)
                    TextField("Collection image", text: $image)
                    HStack {
                        Button("Save") {
                            store.dispatch(Test1ScreenStateAction.setCollectionName(name: name))
                            store.dispatch(Test1ScreenStateAction.setCollectionImage(image: image))
                        }
                    }
                    .buttonStyle(.bordered)

                }
                .frame(width: 300, height: 200)
                
                Divider()
                VStack {
                    Text("RESULT")
                        .font(.title2)
                    Text("Collection name: \(state.test1Screen.collectionName)")
                    Text("Collection image: \(state.test1Screen.collectionImage)")
                }
                .frame(width: 300, height: 200)
                
                Divider()
                NavigationLink {
                    Test2ScreenView().environmentObject(store)
                } label: {
                    Label("Profile", systemImage: "bolt.fill")
                }
                .frame(width: 300, height: 100)
            }
        }
    }
}

#Preview {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    return Test1ScreenView().environmentObject(store)
}
