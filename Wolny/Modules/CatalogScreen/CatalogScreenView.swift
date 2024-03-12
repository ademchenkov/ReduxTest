//
//  CatalogScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct CatalogScreenView: View {
    
    @State private var product: Product
    
    init(
        product: Product
    ) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            header()
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 0)
                .frame(maxWidth: .infinity, maxHeight: 40)
            ProductDetailCardView(product: product)
        }
    }
}

extension CatalogScreenView {
    
    private func header () -> some View {
        
        return ZStack {
            Text("Каталог")
                .font(
                    Font.custom("Manrope", size: 18)
                        .weight(.semibold)
        
                )
                .foregroundColor(.black)
            
            HStack(){
                Spacer()
                Image("catalog-icon")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}


#Preview {
    let product = Product(
        productName: "AUTUMN / BROWN COAT / CLASSIC",
        image: "sample3",
        hasSale: true,
        fullPrice: "10000 ₽",
        salePrice: "8000 ₽",
        advantages: ["Italian Cotton", "Eco", "25 % Sale"],
        sizes: [
            ProductSize(name: "XS", inStock: true),
            ProductSize(name: "S", inStock: true),
            ProductSize(name: "M", inStock: false),
            ProductSize(name: "L", inStock: true),
        ],
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
    )
  
    return CatalogScreenView(product: product)
}
