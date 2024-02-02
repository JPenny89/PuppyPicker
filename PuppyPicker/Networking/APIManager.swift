//
//  APIManager.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

class APIManager {
    func fetchBreedsFromAPI() async throws -> BreedResponse {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let breedResponse = try JSONDecoder().decode(BreedResponse.self, from: data)
        
        return breedResponse
    }
}
