//
//  ScrollViewOffsetPreferenceKeyExample.swift
//  Wolny
//
//  Created by Anton Demchenkov on 28.03.2024.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                action(value)
            })
    }
    
}

struct ScrollViewOffsetPreferenceKeyExample: View {
    
    let title: String = "New title here !!!"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75.0)
                    .onScrollViewOffsetChanged { value in
                        self.scrollViewOffset = value
                    }
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        .overlay(
            navBarLayer
                .opacity(scrollViewOffset < 20 ? 1.0 : 0.0), alignment: .top)
    }
}

extension ScrollViewOffsetPreferenceKeyExample {
    
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.3))
                .frame(width: 300, height: 300)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.gray)
    }
}

#Preview {
    ScrollViewOffsetPreferenceKeyExample()
}
