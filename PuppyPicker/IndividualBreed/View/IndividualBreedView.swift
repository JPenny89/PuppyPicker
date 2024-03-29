//
//  IndividualBreedView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct IndividualBreedView: View {
    @State private var isLoading = false
    @ObservedObject var viewModel = IndividualBreedViewModel()
    
    let grid = GridItems()
    let breed: String
    let displayName: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                if let images = viewModel.images {
                    if images.isEmpty {
                        Text("No subcategories available")
                    } else {
                        ScrollView {
                            LazyVGrid(columns: grid.gridItems, spacing: 1) {
                                ForEach(images, id: \.self) { image in
                                    NavigationLink(destination: DogImageView(displayName: displayName, image: image)) {
                                        AsyncImage(url: URL(string: image))
                                            .scaledToFit()
                                            .frame(width: grid.imageDimension, height: grid.imageDimension)
                                            .clipped()
                                    }
                                }
                            }
                            .accessibilityIdentifier("LazyVGrid label")
                        }
                        .accessibilityIdentifier("Scrollview label")
                    }
                } else {
                    Text("No data available")
                }
            }
        }
        .onAppear() {
            viewModel.fetchImages(breed: breed)
        }
        .navigationTitle(displayName.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    IndividualBreedView(breed: "retriever", displayName: "curly retriever")
}
