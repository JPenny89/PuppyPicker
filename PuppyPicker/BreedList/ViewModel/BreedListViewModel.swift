//
//  BreedListViewModel.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

class BreedListViewModel: ObservableObject {
    @Published var breedResponse: BreedResponse?
    @Published var isLoading = false
    private var apiManager: APIManager
    
    init() {
        self.apiManager = APIManager()
    }
    
    func fetchBreeds() {
        isLoading = true
        Task {
            do {
                let fetchedBreeds = try await apiManager.fetchBreedsFromAPI()
                DispatchQueue.main.async {
                    self.breedResponse = fetchedBreeds
                    self.isLoading = false
                }
            } catch {
                print("Error fetching breeds: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}
