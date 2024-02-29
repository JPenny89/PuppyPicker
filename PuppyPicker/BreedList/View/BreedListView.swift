//
//  BreedListView.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import SwiftUI

struct BreedListView: View {
    @ObservedObject var viewModel = BreedListViewModel()
    @State private var searchBreed = ""
    @State private var isLoading = false
    
    let greyColor = UIColor(named: "GreyColor")
    
    var filteredBreeds: [DogBreed] {
        guard !searchBreed.isEmpty else { return viewModel.dogBreeds }
        return viewModel.dogBreeds.filter { $0.displayName.localizedCaseInsensitiveContains(searchBreed)}
    }
    
    var body: some View {
        NavigationView {
            if !viewModel.dogBreeds.isEmpty {
                List(filteredBreeds, id: \.displayName) { dog in
                    NavigationLink(destination: IndividualBreedView(breed: dog.breed, displayName: dog.displayName))
                    {
                        Text(dog.displayName.capitalized)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Capsule()
                        .fill(Color.init(uiColor: greyColor ?? .white))
                        .padding(2))
                }
                .navigationBarTitle("Breed List")
                .searchable(text: $searchBreed, prompt: "Search Breed")
                .accessibilityIdentifier("searchField")
            } else if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                Text("No data available")
            }
        }
        .scrollContentBackground(.hidden)
        .onAppear {
            viewModel.fetchBreeds()
        }
    }
}

#Preview {
    BreedListView()
}
