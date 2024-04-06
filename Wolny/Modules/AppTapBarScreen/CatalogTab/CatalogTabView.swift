//
//  CatalogScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct CatalogTabView: View {
    
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
        }
    }
}

#Preview {
    
    let products = [
        Product(
            productName: "AUTUMN / BROWN COAT / CLASSIC",
            image: "sample3",
            hasSale: true,
            fullPrice: "10000 ₽",
            salePrice: "8000 ₽",
            advantages: ["Italian Cotton", "Eco", "25 % Sale"],
            sizes: ["XS", "S", "M", "L"],
            descriptions: [
                Description(
                    title: "Подробнее об изделии",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Подобрать размер",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Состав",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Уход",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                )
            ]
        ),
        Product(
            productName: "AUTUMN / BROWN COAT / CLASSIC",
            image: "sample3",
            hasSale: true,
            fullPrice: "10000 ₽",
            salePrice: "8000 ₽",
            advantages: ["Italian Cotton", "Eco", "25 % Sale"],
            sizes: ["XS", "S", "M", "L"],
            descriptions: [
                Description(
                    title: "Подробнее об изделии",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Подобрать размер",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Состав",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Уход",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                )
            ]
        ),
        Product(
            productName: "AUTUMN / BROWN COAT / CLASSIC",
            image: "sample3",
            hasSale: true,
            fullPrice: "10000 ₽",
            salePrice: "8000 ₽",
            advantages: ["Italian Cotton", "Eco", "25 % Sale"],
            sizes: ["XS", "S", "M", "L"],
            descriptions: [
                Description(
                    title: "Подробнее об изделии",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Подобрать размер",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Состав",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                ),
                Description(
                    title: "Уход",
                    text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
                )
            ]
        ),
    ]
    
    return CatalogTabView(products: products)
    
}
