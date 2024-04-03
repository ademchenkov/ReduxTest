//
//  TabBarItem.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import Foundation
import SwiftUI

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
