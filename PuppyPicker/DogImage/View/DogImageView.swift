//
//  DogImageView.swift
//  PuppyPicker
//
//  Created by James Penny on 06/02/2024.
//

import SwiftUI

struct DogImageView: View {
    @Environment(\.dismiss) var dismiss
//    let grid = GridItems()
    let displayName: String
    var image: String
    
    var body: some View {
        VStack {
            SquareImageView(image: image)
            Button("Find more \(displayName.capitalized)s!") {
                dismiss()
            }
            .modifier(ButtonModifier())
            .accessibilityIdentifier("findMoreButton")
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DogImageView(displayName: "beagle", image: "https://images.dog.ceo/breeds/beagle/n02088364_12334.jpg")
}
