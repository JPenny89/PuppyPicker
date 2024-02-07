//
//  ButtonModifier.swift
//  PuppyPicker
//
//  Created by James Penny on 07/02/2024.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let greyColor = UIColor(named: "GreyColor")
    func body(content: Content) -> some View {
        
        if dynamicTypeSize.isAccessibilitySize {
            content
                .fontWeight(.semibold)
                .background((Color.init(uiColor: greyColor ?? .white)))
                .cornerRadius(8)
                .padding()
        } else {
            content
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 300, height: 44)
                .background((Color.init(uiColor: greyColor ?? .white)))
                .cornerRadius(8)
                .padding()
        }
        
    }
}
