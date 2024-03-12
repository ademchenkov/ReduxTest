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
            
            pricesView(
                hasSale: product.hasSale,
                fullPrice: product.fullPrice,
                salePrice: product.salePrice
            )
            
            advantagesView(
                advantages: product.advantages
            )
        }
        .padding(.vertical, 8)
    }
}

extension ProductCardView {
    private func pricesView(hasSale: Bool, fullPrice: String, salePrice: String) -> some View {
        let hasSale = hasSale
        let salePrice = salePrice
        let fullPrice = fullPrice

        return HStack {
            fullPriceView(fullPrice: fullPrice, hasSale: hasSale)
            if hasSale {
                salePriceView(salePrice: salePrice)
            }
        }
    }
    
    private func fullPriceView(fullPrice: String, hasSale: Bool) -> some View {
        let fullPrice = fullPrice
        let hasSale = hasSale
            
        if hasSale {
            return Text(fullPrice)
                .font(PriceViewStyle.fullPriceFont)
                .foregroundColor(PriceViewStyle.fullPriceHasSaleColor)
                .strikethrough()
        } else {
            return Text(fullPrice)
                .font(PriceViewStyle.fullPriceFont)
                .foregroundColor(PriceViewStyle.fullPriceColor)
        }
    }
    
    private func salePriceView(salePrice: String) -> some View {
        let salePrice = salePrice
            
        return Text(salePrice)
            .font(PriceViewStyle.salePriceFont)
            .foregroundColor(PriceViewStyle.salePriceColor)
    }
}


extension ProductCardView {
    func advantagesView(advantages: [String]? = []) -> some View {
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

extension ProductCardView {
    func expandableDescriptions() -> some View {
        return Text("")
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
  
    return ProductCardView(product: product)
}
