//
//  IndividualBreedView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct IndividualBreedView: View {
    
    var breed: String = ""
    var subBreed: String = ""
    var displayName: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("breed = \(breed)")
            Spacer()
            Text("subBreed = \(subBreed)")
            Spacer()
            Text("displayName = \(displayName)")
            Spacer()
        }
    }
}

#Preview {
    IndividualBreedView()
}
