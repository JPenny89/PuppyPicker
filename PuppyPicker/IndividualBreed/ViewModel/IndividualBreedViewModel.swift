//
//  IndividualBreedViewModel.swift
//  PuppyPicker
//
//  Created by James Penny on 06/02/2024.
//

import Foundation

class IndividualBreedViewModel: ObservableObject {
    @Published var images: [String]?
    @Published var isLoading = false
    
    private var apiManager: APIManager
    init() {
        self.apiManager = APIManager()
    }
    
    @MainActor
    func fetchImages(breed: String) {
        isLoading = true
        Task {
            do {
                self.images = try await APIManager.shared.fetchImagesFromAPI(breed: breed)
                print("images = \([images])")
            } catch {
                print("Error fetching images: \(error)")
                self.images = nil
            }
            self.isLoading = false
        }
    }
}
