//
//  AppStyles.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import Foundation
import SwiftUI

struct CustomTabBarViewStyle {
    
    static let textColor: Color = .white
    static let backgroundColor: Color = .firmGray
    static let font: Font = .custom("Manrope", size: 13)
}

struct PriceViewStyle {
    
    static let fullPriceFont: Font = .custom("Manrope", size: 13).weight(.semibold)
    static let salePriceFont: Font = .custom("Manrope", size: 13).weight(.semibold)
    
    static let salePriceColor: Color = .black
    static let fullPriceColor: Color = .black
    static let fullPriceHasSaleColor: Color = Color(red: 0.35, green: 0.34, blue: 0.34)

}

struct ProductCardViewStyle {
    
    static let productNameFont: Font = .custom("Manrope", size: 14)
    static let productNameColor: Color = .black

}

struct DetailProductCardViewStyle {
    
    static let productNameFont: Font = .custom("Manrope", size: 12)
    static let productNameColor: Color = Color(red: 0.09, green: 0.09, blue: 0.09)
    static let productAdvantageFont: Font = .custom("Manrope", size: 12)
    static let productAdvantageColor: Color = .white
    static let productAdvantageBackgroundColor: Color = Color(red: 0.35, green: 0.34, blue: 0.34)

}
