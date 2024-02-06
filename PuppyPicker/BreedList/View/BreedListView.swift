//
//  BreedListView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct BreedListView: View {
    @State private var isLoading = false
    @ObservedObject var viewModel = BreedListViewModel()
    
    var body: some View {
        NavigationView {
            if !viewModel.dogBreeds.isEmpty {
                List(viewModel.dogBreeds, id: \.displayName) { post in
                    NavigationLink(destination: IndividualBreedView(breed: post.breed, subBreed: post.subBreed ?? "", displayName: post.displayName))
                    {
                        Text("\(post.displayName)")
                    }
                }
                .navigationBarTitle("Breed List")
            } else if viewModel.isLoading {
                ProgressView("Loading...")
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