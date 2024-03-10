//
//  ExpandableDescritionView.swift
//  Wolny
//
//  Created by Anton Demchenkov on 10.03.2024.
//

import SwiftUI

struct ExpandableDescriptionView: View {
        
    @State private var description: Description
 
    init(description: Description) {
        self.description = description
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("\(description.title)")
                    .font(Font.custom("Manrope", size: 12).weight(.semibold))
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                Spacer()
                Image(description.isExpanded ?? true ? "expanded-icon" : "rolled-icon")
            }
            .padding(.leading, 24)
            .padding(.trailing, 40)
            .padding(.vertical, 2)
            .frame(maxWidth: .infinity, alignment: .center)
            
            if description.isExpanded ?? true {
                HStack(alignment: .top, spacing: 24) {
                    Text("\(description.text)")
                        .font(Font.custom("Manrope", size: 12))
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.leading, 24)
                .padding(.trailing, 40)
                .padding(.vertical, 2)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }
    }
}

public struct Description: Hashable, Codable {
    var isExpanded: Bool? = true
    let title: String
    let text: String
    
    init(
        isExpanded: Bool,
        title: String,
        text: String
    ) {
        self.isExpanded = isExpanded
        self.title = title
        self.text = text
    }
}


#Preview {
    
    let description = Description(
        isExpanded: false,
        title: "Подробнее об изделии",
        text: "Lorem ipsum dolor sit amet consectetur. \nTurpis libero feugiat convallis pharetra. \nNisl venenatis rhoncus elementum aliquet ultricies."
    )
    
    return ExpandableDescriptionView(description: description)
}
