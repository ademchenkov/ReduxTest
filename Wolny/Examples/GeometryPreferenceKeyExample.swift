//
//  GeometryPreferenceKeyExample.swift
//  Wolny
//
//  Created by Anton Demchenkov on 28.03.2024.
//

import SwiftUI

struct GeometryPreferenceKeyExample: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.orange)
            Spacer()
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}


struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}


#Preview {
    GeometryPreferenceKeyExample()
}
