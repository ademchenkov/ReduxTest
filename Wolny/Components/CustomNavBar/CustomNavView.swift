//
//  CustomNavView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 03.04.2024.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden)
        }
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
}


#Preview {
    CustomNavView {
        Color.mint.ignoresSafeArea()
    }
}
