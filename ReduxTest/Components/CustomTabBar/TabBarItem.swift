//
//  TabBarItem.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let title: String
//}

enum TabBarItem: Hashable {
    case home, catalog, account, bag
    
    var title: String {
        switch self {
        case .home: return "ГЛАВНАЯ"
        case .catalog: return "КАТАЛОГ"
        case .account: return "АККАУНТ"
        case .bag: return "ЗАКАЗ"
        }
    }
}
    
struct TabBarStyle {
    static let textColor: Color = .white
    static let backgroundColor: Color = .firmGray
    static let font: Font = .custom("Manrope", size: 15)
}
