//
//  GridItems.swift
//  PuppyPicker
//
//  Created by James Penny on 07/02/2024.
//

import SwiftUI

struct GridItems {
    let gridItems: [GridItem] = [
        // Creates 2x grid items with flexible size. Spacing of 1 pixel.
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let imageDimension: CGFloat = (UIScreen.main.bounds.width / 2) - 1
}
