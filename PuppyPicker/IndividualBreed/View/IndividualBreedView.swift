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
    let breed: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                if let images = viewModel.images {
                    if images.isEmpty {
                        Text("No subcategories available")
                    } else {
                        List(images, id: \.self) { image in
                            AsyncImage(url: URL(string: image), content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }, placeholder: {
                                ProgressView("Loading...")
                            })
                        }
                    }
                } else {
                    Text("No data available")
                }
            }
        }
        .onAppear {
            viewModel.fetchImages(breed: breed)
        }
        .navigationTitle(breed)
    }
}

#Preview {
    IndividualBreedView(breed: "australian")
}
