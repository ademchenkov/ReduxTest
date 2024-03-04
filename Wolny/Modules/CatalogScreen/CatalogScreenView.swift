//
//  CatalogScreenView.swift
//  ReduxTest
//
//  Created by Anton Demchenkov on 24.02.2024.
//

import SwiftUI

struct CatalogScreenView: View {
    var body: some View {
        VStack {
            header()
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 0)
                .frame(maxWidth: .infinity, maxHeight: 40)
            ProductCardsGridView()
        }
    }
}

extension CatalogScreenView {
    
    private func header () -> some View {
        
        return ZStack {
            Text("Каталог")
                .font(
                    Font.custom("Manrope", size: 18)
                        .weight(.semibold)
        
                )
                .foregroundColor(.black)
            
            HStack(){
                Spacer()
                Image("catalog-icon")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}


#Preview {
    CatalogScreenView()
}
