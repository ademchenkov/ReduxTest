//
//  ProductCardView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    @State private var image: String = "sample2"
    @State private var productName: String = "Black coat slim fit"
    @State private var hasSale: Bool = true
    @State private var fullPrice: String = "10000 ₽"
    @State private var salePrice: String = "8000 ₽"
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 500)
                .clipped()
            
            Text(productName)
                .font(ProductCardStyle.productNameFont)
                .foregroundColor(ProductCardStyle.productNameColor)
            
            priceView(fullPrice: fullPrice, salePrice: salePrice, hasSale: hasSale)
        }
        .padding(0)
//        .border(Color.gray, width: 0.2)
        .frame(maxWidth: .infinity, maxHeight: 540)
    }
}

extension ProductCardView {
    
    private func priceView(fullPrice: String, salePrice: String?, hasSale: Bool = false) -> some View {
        
        let fullPrice = fullPrice
        let salePrice = salePrice ?? nil
        let hasSale = hasSale
            
        return HStack {
            fullPriceView(fullPrice: fullPrice, hasSale: hasSale)
            if hasSale {
                salePriceView(salePrice: salePrice!)
            }
        }
    }
    
}

extension ProductCardView {
    private func fullPriceView(fullPrice: String, hasSale: Bool = false) -> some View {
        
        let fullPrice = fullPrice
        let hasSale = hasSale
        
        if hasSale {
            return Text(fullPrice)
                .font(ProductCardStyle.fullPriceFont)
                .foregroundColor(ProductCardStyle.fullPriceHasSaleColor)
                .strikethrough()
        } else {
            return Text(fullPrice)
                .font(ProductCardStyle.fullPriceFont)
                .foregroundColor(ProductCardStyle.fullPriceColor)
        }
    }
    
    private func salePriceView(salePrice: String) -> some View {
        
        let salePrice = salePrice
        
        return Text(salePrice)
            .font(ProductCardStyle.salePriceFont)
            .foregroundColor(ProductCardStyle.salePriceColor)
    }
}


#Preview {
    
    return ProductCardView()
}
