//
//  DetailProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 05.03.2024.
//

import SwiftUI

struct DetailProductCardView: View {
    @State private var product: Product
    
    init(
        product: Product
    ) {
        self.product = product
    }
        
    var body: some View {
        
        VStack() {
            HStack() {
                Image("back-icon")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .frame(maxHeight: 16)
            .padding(.horizontal, 8)
        }
        
        ProductCardView(product: product)        
        productSizes(sizes: product.sizes)
        productDescriptions(descriptions: product.descriptions)
    }
}

extension DetailProductCardView {
    func productSizes(sizes: [ProductSize]? = []) -> some View {
        
        let sizes = sizes!.prefix(4)
        
        return HStack(alignment: .center, spacing: 16) {
            ForEach(sizes, id: \.self) { size in
                HStack {
                    Text("\(size.name)")
                        .font(
                            Font.custom("Manrope", size: 12)
                                .weight(.medium)
                        )
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frame(width: 64, height: 24, alignment: .center)
                .background(size.inStock ?  Color.clear : Color(red: 0.35, green: 0.34, blue: 0.34).opacity(0.35))
                .overlay(
                    Rectangle()
                        .inset(by: 0.2)
                        .stroke(Color(red: 0.35, green: 0.34, blue: 0.34), lineWidth: 0.4)
                )
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
    }
}

extension DetailProductCardView {
    func productDescriptions(descriptions: [Description]? = []) -> some View {
        
        let descriptions = product.descriptions
        
        return ForEach(descriptions, id: \.self) { description in
            ExpandableDescriptionView(description: description)
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
  
    return DetailProductCardView(product: product)
}
