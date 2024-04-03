//
//  HomeScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 23.02.2024.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var store: Store<AppState>
    
    
    var body: some View {
        
        ZStack {
            Image("sample1")
                .resizable()
                .clipped()
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 65)
                
                Text("JUST BEGIN / Spring'24")
                    .padding(.leading, 24)
                    .font(CustomFont.h1)
                    .foregroundColor(.white)
                Spacer()
                
                Image("wolny-white-logo")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Spacer()
                
                CustomButton(
                    text: "ПЕРЕЙТИ"
                )
                    .padding(.horizontal, 24)
                    .onTapGesture {
                        store.dispatch(AppTapBarStateAction.selectTab(tab: .catalog))
                    }
                Spacer()
                    .frame(height: 50)
            }
        }
        .ignoresSafeArea(.all)
        

    }
}

#Preview {
    HomeTabView()
}
