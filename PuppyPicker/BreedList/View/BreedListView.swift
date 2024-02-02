//
//  BreedListView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct BreedListView: View {
    @State private var breedResponse: BreedResponse?
    @State private var isLoading = false
    @ObservedObject var viewModel = BreedListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let breedsResponse = viewModel.breedResponse {
                List(breedsResponse.message.keys.sorted(), id: \.self) { breedName in
                    NavigationLink(destination: IndividualBreedView()) {
                        Text(breedName)
                    }
                }
                .navigationBarTitle("Breed List")
            } else {
                Text("No data available")
            }
        }
        .onAppear {
            viewModel.fetchBreeds()
        }
    }
}

#Preview {
    BreedListView()
}
