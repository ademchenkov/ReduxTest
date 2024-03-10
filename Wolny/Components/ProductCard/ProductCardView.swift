//
//  ProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    @State private var product: Product
    
    init(
        product: Product
    ) {
        self.product = product
    }
    
    var body: some View {
        
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 375, height: 450)
                .clipped()
                .padding(.horizontal, 8)
            
            Text(product.productName)
                .font(DetailProductCardViewStyle.productNameFont)
                .foregroundColor(DetailProductCardViewStyle.productNameColor)
            
            PriceView(
                hasSale: product.hasSale,
                fullPrice: product.fullPrice,
                salePrice: product.salePrice!
            )
            productAdvantages(advantages: product.advantages)
        }
        .padding(.vertical, 8)
    }
}

extension ProductCardView {
    func productAdvantages(advantages: [String]? = []) -> some View {
        
        let advantages = advantages!.prefix(3)

        return HStack {
            ForEach(advantages, id: \.self) { advantage in
                Text("\(advantage)")
                    .font(DetailProductCardViewStyle.productAdvantageFont)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 1)
                    .foregroundColor(DetailProductCardViewStyle.productAdvantageColor)
                    .background(DetailProductCardViewStyle.productAdvantageBackgroundColor)
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
                isExpanded: true,
                title: "Подробнее об изделии",
                text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
            ),
            Description(
                isExpanded: false,
                title: "Подобрать размер",
                text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
            ),
            Description(
                isExpanded: false,
                title: "Состав",
                text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
            ),
            Description(
                isExpanded: false,
                title: "Уход",
                text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
            )
        ]
    )
  
    return ProductCardView(product: product)
}
