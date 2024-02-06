//
//  BreedListViewModel.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

class BreedListViewModel: ObservableObject {
    @Published var dogBreeds: [DogBreed]
    @Published var isLoading = false
    private var apiManager: APIManager
    
    init() {
        self.apiManager = APIManager()
        self.dogBreeds = [DogBreed]()
    }
    
    @MainActor
    func fetchBreeds() {
        isLoading = true
        Task {
            do {
                let dogBreeds = try await apiManager.fetchDogBreedsByAPI()
                for breed in dogBreeds {
                    print(breed.displayName)
                    self.dogBreeds = dogBreeds.sorted(by: { $0.displayName < $1.displayName })
                }
            } catch {
                print("Error fetching dog breeds: \(error)")
            }
        }
    }
}
