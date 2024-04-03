//
//  AppNavBarView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 01.04.2024.
//

import SwiftUI

struct AppNavBarView: View {
    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {
            CustomNavView {
                ZStack {
                    Color.mint.ignoresSafeArea()
                    
                    CustomNavLink(
                        destination: {
                            Text("Destination")
                            .customNavigationBarItems(
                                title: "Second Screen",
                                backButtonHidden: false
                            )
                        },
                        label: { Text("Navigate") }
                    )
                }
                .customNavigationBarItems(
                    title: "First Screen",
                    backButtonHidden: true
                )
            }
        }
    }
}

#Preview {
    AppNavBarView()
}
