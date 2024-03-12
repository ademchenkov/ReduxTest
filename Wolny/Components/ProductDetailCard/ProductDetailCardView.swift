//
//  DetailProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 05.03.2024.
//

import SwiftUI

struct ProductDetailCardView: View {
    @State private var product: Product
    @State private var expandedDescriptions: [Bool]
    
    init(product: Product) {
        self._product = State(initialValue: product)
        self._expandedDescriptions = State(initialValue: Array(repeating: true, count: product.descriptions.count))
    }
        
    var body: some View {
        ScrollView() {
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
            productDescriptionsView()
        }
    }
}

extension ProductDetailCardView {
    private func productSizes(sizes: [ProductSize]? = []) -> some View {
        
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

extension ProductDetailCardView {

    private func productDescriptionsView() -> some View {
        ForEach(Array(product.descriptions.enumerated()), id: \.element) { index, description in
            expandableDescriptionView(description: description, index: index)
        }
    }
    
    private func toggleDescription(index: Int) {
        expandedDescriptions[index].toggle()
    }
    
    private func expandableDescriptionView (description: Description, index: Int) -> some View {
        let description = description
        
        return VStack {
            HStack(alignment: .center) {
                Text("\(description.title)")
                    .font(Font.custom("Manrope", size: 12).weight(.semibold))
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                Spacer()
                Button {
                    withAnimation(.easeInOut.speed(1.3)) {
                        toggleDescription(index: index)
                    }
                } label: {
                    Image(expandedDescriptions[index] ? "expanded-icon" : "rolled-icon")
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.leading, 24)
            .padding(.trailing, 40)
            .padding(.vertical, 2)
            .frame(maxWidth: .infinity, alignment: .center)
            
            if expandedDescriptions[index] {
                HStack(alignment: .top, spacing: 24) {
                    Text("\(description.text)")
                        .font(Font.custom("Manrope", size: 12))
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.leading, 24)
                .padding(.trailing, 40)
                .padding(.vertical, 2)
                .frame(maxWidth: .infinity, alignment: .topLeading)
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
  
    return ProductDetailCardView(product: product)
}
