//
//  AppStyles.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import Foundation
import SwiftUI

struct TabBarStyle {
    
    static let textColor: Color = .white
    static let backgroundColor: Color = .firmGray
    static let font: Font = .custom("Manrope", size: 13)
}

struct ProductCardStyle {
    
    static let productNameFont: Font = .custom("Manrope", size: 14)
    static let fullPriceFont: Font = .custom("Manrope", size: 13).weight(.semibold)
    static let salePriceFont: Font = .custom("Manrope", size: 13).weight(.semibold)
    
    static let productNameColor: Color = .black
    static let salePriceColor: Color = .black
    static let fullPriceColor: Color = .black
    static let fullPriceHasSaleColor: Color = Color(red: 0.35, green: 0.34, blue: 0.34)
    
}
