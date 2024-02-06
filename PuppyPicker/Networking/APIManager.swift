//
//  APIManager.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    enum DogAPIError: Error {
        case decodingError
    }
    
    func fetchDogBreedsByAPI() async throws -> [DogBreed] {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(BreedResponse.self, from: data)
            var dogBreeds: [DogBreed] = []
            for (breed, subBreeds) in response.message {
                if subBreeds.isEmpty {
                    // If there are no sub-breeds, create a DogBreed object without sub-breed
                    let dogBreed = DogBreed(breed: breed)
                    dogBreeds.append(dogBreed)
                } else {
                    // If there are sub-breeds, iterate through each sub-breed and create DogBreed objects
                    for subBreed in subBreeds {
                        let dogBreed = DogBreed(breed: breed, subBreed: subBreed)
                        dogBreeds.append(dogBreed)
                    }
                }
            }
            return dogBreeds
        } catch {
            throw DogAPIError.decodingError
        }
    }
    
    func fetchImagesFromAPI(breed: String) async throws -> [String]? {
        let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images/random/10")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let imageResponse = try decoder.decode(ImageResponse.self, from: data)
        if let images = imageResponse.message {
            return images
        } else {
            print("No images available")
            return nil
        }
    }
}
