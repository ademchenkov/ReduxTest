//
//  HomeScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 23.02.2024.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var store: Store<AppState>
    
    
    var body: some View {
        
        ZStack {
            Image("sample1")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipped()
            
            
            VStack {
                Text("JUST BEGIN / Spring'24")
                    .foregroundColor(.white)
                Image("wolny_white_vector")
            }
        }
        .frame(maxHeight: .infinity)
        .ignoresSafeArea(.all)

        
    }
}

#Preview {
    HomeScreenView()
}
