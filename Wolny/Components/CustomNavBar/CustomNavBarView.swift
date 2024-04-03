//
//  CustomNavBarView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 01.04.2024.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment (\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let showBackButton: Bool
    let title: String
    
    
    var body: some View {
        HStack(alignment: .center) {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .padding(.horizontal, 16)
        .background(colorScheme == .light ? .white : Color(CustomColor.firmGray))
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(
            action: {
                dismiss()
            },
            label: {
                Image(colorScheme == .light ? "left-arrow-light" : "left-arrow-dark")
            }
        )
    }
    
    private var titleSection: some View {
        Text(title)
            .font(CustomFont.h2)
            .foregroundColor(colorScheme == .light ? Color(CustomColor.firmGray) : .white)
    }
}

#Preview {
    
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title")
        Spacer()
    }

}
