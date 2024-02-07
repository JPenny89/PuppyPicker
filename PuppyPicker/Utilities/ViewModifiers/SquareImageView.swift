//
//  SquareImageView.swift
//  PuppyPicker
//
//  Created by James Penny on 07/02/2024.
//

import SwiftUI

struct SquareImageView: View {
    var image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image))
            .scaledToFit()
            .frame(width: 300, height: 300)
            .clipShape(Rectangle())
    }
}

#Preview {
    SquareImageView(image: "beagle")
}
