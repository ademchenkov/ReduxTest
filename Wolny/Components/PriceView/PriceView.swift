//
//  SalesPriceView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 08.03.2024.
//

import SwiftUI

struct PriceView: View {
    @State private var hasSale: Bool
    @State private var fullPrice: String
    @State private var salePrice: String
    
    init(
        hasSale: Bool = false,
        fullPrice: String,
        salePrice: String = ""
    ) {
        self.hasSale = hasSale
        self.fullPrice = fullPrice
        self.salePrice = salePrice
    }
    
    var body: some View {
        
        HStack {
            fullPriceView(fullPrice: fullPrice, hasSale: hasSale)
            if hasSale {
                salePriceView(salePrice: salePrice)
            }
        }
    }
}

extension PriceView {
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
    
    
#Preview {
    let hasSale = true
    let fullPrice = "10000 ₽"
    let salePrice = "8000 ₽"
    
    return PriceView(hasSale: hasSale, fullPrice: fullPrice, salePrice: salePrice)
    
}
