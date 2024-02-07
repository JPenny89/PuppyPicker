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
    let greyColor = UIColor(named: "GreyColor")
    
    var body: some View {
        NavigationView {
            if !viewModel.dogBreeds.isEmpty {
                List(viewModel.dogBreeds, id: \.displayName) { dog in
                    NavigationLink(destination: IndividualBreedView(breed: dog.breed, displayName: dog.displayName))
                    {
                        Text(dog.displayName.capitalized)
                    }
                    .listRowBackground(Capsule()
                        .fill(Color.init(uiColor: greyColor ?? .white))
                        .padding(2))
                }
                .navigationBarTitle("Breed List")
                
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
