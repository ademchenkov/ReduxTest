//
//  CustomNavBarPreferenceKeys.swift
//  Wolny
//
//  Created by Anton Demchenkov on 04.04.2024.
//

import Foundation
import SwiftUI

//@State private var showBackButton: Bool = true
//@State private var title: String = "Navigation bar" //""

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

extension View {
    
    func customNavigationBarTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationBarItems(title: String = "", backButtonHidden: Bool = false) -> some View {
        self
            .customNavigationBarTitle(title)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
