//
//  CatalogScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct CatalogTabView: View {
    
    @Environment (\.colorScheme) var colorScheme
    var products: [Product] = []
    
    init(products: [Product]) {
        self.products = products
    }
    
    var body: some View {
        CustomNavBarContainerView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach (products, id: \.self) { products in
                        ProductCardView(product: products)
                    }
                }
            }
            .customNavigationBarItems(title: "Каталог", backButtonHidden: true)
            .background(colorScheme == .light ? .white : CustomColor.firmGray)
        }
    }
}

#Preview {
    
    let products = mockProducts
    
    return CatalogTabView(products: products)
    
}
