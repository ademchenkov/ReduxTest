//
//  CustomNavLink.swift
//  Wolny
//
//  Created by Anton Demchenkov on 29.03.2024.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(
        @ViewBuilder destination: () -> Destination,
        @ViewBuilder label: () -> Label
    ) {
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        
        NavigationLink(
            destination: CustomNavBarContainerView(content: {
                destination
            })
            .toolbar(.hidden)
             ,
            label: { label }
        )
    }
}

#Preview {
    CustomNavView {
        CustomNavLink(
            destination: { Text("Destination") },
            label: { Text("CLICK ME") }
        )
    }
}
