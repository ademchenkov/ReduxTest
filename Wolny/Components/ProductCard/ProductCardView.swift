//
//  ProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    @Environment (\.colorScheme) var colorScheme
    @State private var product: Product
    
    init(
        product: Product
    ) {
        self.product = product
    }
    
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 395, height: 450)
                .clipped()
        
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4) {
                Text(product.productName)
                    .font(CustomFont.detailCardProductName)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                prices(
                    hasSale: product.hasSale,
                    fullPrice: product.fullPrice,
                    salePrice: product.salePrice
                )
                
                advantages(
                    advantages: product.advantages
                )
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .padding(0)
        .background(colorScheme == .light ? .white : (CustomColor.firmGray))
        .overlay(
            Rectangle()
                .stroke(Color(colorScheme == .light ? (CustomColor.firmGray) : .white), lineWidth: 0.1)

        )
    }
}

extension ProductCardView {
    private func prices(hasSale: Bool, fullPrice: String, salePrice: String) -> some View {
        let hasSale = hasSale
        let salePrice = salePrice
        let fullPrice = fullPrice

        return HStack {
            fullPriceItem(fullPrice: fullPrice, hasSale: hasSale)
            if hasSale {
                salePriceItem(salePrice: salePrice)
            }
        }
    }
    
    private func fullPriceItem(fullPrice: String, hasSale: Bool) -> some View {
        let fullPrice = fullPrice
        let hasSale = hasSale
            
        if hasSale {
            return Text(fullPrice)
                .font(CustomFont.detailCardPriceView)
                .foregroundColor(colorScheme == .light ? (CustomColor.firmGray) : .white)
                .strikethrough()
        } else {
            return Text(fullPrice)
                .font(CustomFont.detailCardPriceView)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .fontWeight(.semibold)
        }
    }
    
    private func salePriceItem(salePrice: String) -> some View {
        let salePrice = salePrice
            
        return Text(salePrice)
            .font(CustomFont.detailCardPriceView)
            .foregroundColor(colorScheme == .light ? .black : .white)
            .fontWeight(.semibold)
    }
}


extension ProductCardView {
    func advantages(advantages: [String]? = []) -> some View {
        let advantages = advantages!.prefix(3)

        return HStack {
            ForEach(advantages, id: \.self) { advantage in
                Text("\(advantage)")
                    .font(CustomFont.detailCardProductAdvantage)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 1)
                    .foregroundColor(colorScheme == .light ? .white : (CustomColor.firmGray))
                    .background(colorScheme == .light ? (CustomColor.firmGray) : .white)
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
        sizes: ["XS", "S", "M","L"],
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
