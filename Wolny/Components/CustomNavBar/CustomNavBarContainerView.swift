//
//  CustomNavBarContainerView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 02.04.2024.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @Environment (\.colorScheme) var colorScheme
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView {
        Text("Hello world!")
            .customNavigationBarItems(title: "Title", backButtonHidden: false)
    }
}
