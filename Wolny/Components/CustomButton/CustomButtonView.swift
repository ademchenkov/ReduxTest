//
//  ButtonView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 19.03.2024.
//

import SwiftUI

struct CustomButton: View {
    var text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
            HStack(alignment: .center, spacing: 0) {
                Text("ПЕРЕЙТИ")
                    .font(
                    Font.custom("Manrope", size: 12).weight(.medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
            .background(Color(red: 0.09, green: 0.09, blue: 0.09).opacity(0.55))
            .overlay(
                Rectangle()
                    .inset(by: 0.2)
                    .stroke(.white, lineWidth: 0.4)
            )
    }
}


#Preview {
    let text = "ПЕРЕЙТИ"
    
    return CustomButton(text: text)
}
