//
//  DetailProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 05.03.2024.
//

import SwiftUI

struct ProductDetailCardView: View {
    
    @Environment (\.colorScheme) var colorScheme
    @State private var product: Product
    @State private var expandedDescriptions: [Bool]
    
    init(product: Product) {
        self._product = State(initialValue: product)
        self._expandedDescriptions = State(initialValue: Array(repeating: true, count: product.descriptions.count))
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ProductCardView(product: product)
                productSizes(sizes: product.sizes)
                productDescriptions
            }
        }
    }
}

extension ProductDetailCardView {
    private func productSizes(sizes: [String]? = []) -> some View {
        
        let sizes = sizes!.prefix(4)
        
        return HStack(alignment: .center, spacing: 16) {
            ForEach(sizes, id: \.self) { sizes in
                HStack {
                    Text("\(sizes)")
                        .font(
                            CustomFont.detailCardProductAdvantage
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(colorScheme == .light ? .black : .white))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frame(width: 64, height: 24, alignment: .center)
                .overlay(
                    Rectangle()
                        .inset(by: 0.2)
                        .stroke((colorScheme == .light ? CustomColor.firmGray : .white), lineWidth: 0.4)
                )
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
        .background(Color(colorScheme == .light ? .white : CustomColor.firmGray))
    }
}

extension ProductDetailCardView {

    private var productDescriptions: some View {
        ForEach(Array(product.descriptions.enumerated()), id: \.element) { index, description in
            expandableDescription(description: description, index: index)
        }
    }
    
    private func toggleDescription(index: Int) {
        expandedDescriptions[index].toggle()
    }
    
    private func expandableDescription (description: Description, index: Int) -> some View {
        let description = description
        
        return VStack {
            HStack(alignment: .center) {
                Text("\(description.title)")
                    .font(CustomFont.detailCardProductDescription.weight(.semibold))
                    .foregroundColor(Color(colorScheme == .light ? .black : .white))
                Spacer()
                Button {
                    withAnimation(.easeInOut.speed(1.3)) {
                        toggleDescription(index: index)
                    }
                } label: {
                    Image(expandedDescriptions[index] ? (colorScheme == .light ? "expanded-icon-light" : "expanded-icon-dark") : (colorScheme == .light ? "rolled-icon-light" : "rolled-icon-dark"))
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
                        .font(CustomFont.detailCardProductDescription)
                        .foregroundColor(Color(colorScheme == .light ? .black : .white))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.leading, 24)
                .padding(.trailing, 40)
                .padding(.vertical, 2)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }
        .background(Color(colorScheme == .light ? .white : CustomColor.firmGray))
    }
}


#Preview {
    
    let product = mockProducts[0]
  
    return (ProductDetailCardView(product: product))
}
