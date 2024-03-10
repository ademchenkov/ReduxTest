//
//  AppTabBarView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 02.03.2024.
//

import SwiftUI

struct AppTabBarView: View {
    @EnvironmentObject var store: Store<AppState>
    
    @State private var product: Product = Product(
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
    
 //   @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            HomeScreenView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            CatalogScreenView(product: product)
                .tabBarItem(tab: .catalog, selection: $tabSelection)
            AccountScreenView()
                .tabBarItem(tab: .account, selection: $tabSelection)
//            Test1ScreenView()
//                .tabBarItem(tab: .bag, selection: $tabSelection)
            BagScreenView()
                .tabBarItem(tab: .bag, selection: $tabSelection)
        }
        .onChange(of: tabSelection) {
            store.dispatch(AppTapBarStateAction.selectTab(tab: tabSelection))
        }
    }
}

#Preview {
    let store = Store<AppState>(
        initialState: AppState(),
        reducer: AppState.reducer
    )
    return AppTabBarView()
        .environmentObject(store)
}
