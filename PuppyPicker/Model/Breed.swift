//
//  Breed.swift
//  PuppyPicker
//
//  Created by James Penny on 01/02/2024.
//

import Foundation

struct BreedResponse: Codable {
    let message: [String: [String]]
    let status: String
}
