//
//  AppStyles.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 03.03.2024.
//

import Foundation
import SwiftUI


public struct CustomFont {
    
    static let h1: Font = .custom("Manrope", size: 18).weight(.bold)
    static let h2: Font = .custom("Manrope", size: 16)
    static let h3: Font = .custom("Manrope", size: 13).weight(.semibold)
    static let h4: Font = .custom("Manrope", size: 12)
    
    
    static let detailCardProductName: Font = .custom("Manrope", size: 12)
    static let detailCardPriceView: Font = .custom("Manrope", size: 13)
    static let detailCardProductAdvantage: Font = .custom("Manrope", size: 12)
    static let detailCardProductDescription: Font = .custom("Manrope", size: 12)
    
    
    static let activeTabItem: Font = .custom("Manrope", size: 13).weight(.black)
    static let tabItem: Font = .custom("Manrope", size: 13).weight(.medium)
}

public struct CustomColor {
    
    static let firmBlack: Color = Color(red: 0.09, green: 0.09, blue: 0.09)
    static let firmGray: Color = Color(red: 0.44, green: 0.44, blue: 0.45)
}


struct CustomTabBarViewStyle {
    
    static let textColor: Color = .white
    static let backgroundColor: Color = CustomColor.firmGray
    static let font: Font = .custom("Manrope", size: 13)
}
