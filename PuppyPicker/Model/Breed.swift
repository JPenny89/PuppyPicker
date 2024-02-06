//
//  Breed.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

struct BreedResponse: Codable {
    let message: [String: [String]] // Dictionary where key is the breed and value is an array of sub-breeds
    let status: String
}

struct DogBreed: Codable {
    let breed: String
    let subBreed: String?
    
    init(breed: String, subBreed: String? = nil) {
        self.breed = breed
        self.subBreed = subBreed
    }
    
    var displayName: String {
        if let subBreed = subBreed {
            return "\(subBreed) \(breed)"
        } else {
            return breed
        }
    }
}

struct ImageResponse: Codable {
    let message: [String]?
    let status: String
}
