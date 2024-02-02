//
//  IndividualBreedView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct IndividualBreedView: View {
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "dog")
            Spacer()
            Text("Hello, Dog!")
            Spacer()
            Image(systemName: "dog")
            Spacer()
        }
    }
}

#Preview {
    IndividualBreedView()
}
