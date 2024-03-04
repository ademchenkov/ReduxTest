//
//  ProductCardsGridView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import SwiftUI

struct ProductCardsGridView: View {
    var body: some View {
        ScrollView() {
            Grid(verticalSpacing: 16) {
                ProductCardView()
                ProductCardView()
                ProductCardView()
            }
        }

    }
}

#Preview {
    ProductCardsGridView()
}
