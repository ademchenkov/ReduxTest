//
//  CatalogScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct CatalogTabView: View {
    
    @Environment (\.colorScheme) var colorScheme
    var products: [Product] = mockProducts
    
    init(products: [Product]) {
        self.products = products
    }
    
    var body: some View {
        CustomNavView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach (products, id: \.self) { products in
                        CustomNavLink {
                            ProductDetailCardView(product: products)
                            .customNavigationBarItems(
                                title: products.productName,
                                backButtonHidden: false
                            )
                        } label: {
                            ProductCardView(product: products)
                        }
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
