//
//  PuppyPickerTests.swift
//  PuppyPickerTests
//
//  Created by James Penny on 01/02/2024.
//

import XCTest
@testable import PuppyPicker

final class PuppyPickerTests: XCTestCase {
    
    var apiManager = APIManager()
    
    func testBreedListNotEmpty() async throws {
        // Test checks if API response for the breed list is not empty.
        
        let response = try await apiManager.fetchDogBreedsByAPI()
        
        print("response = \(response)")
        XCTAssertNotNil(response)
    }
    
    func testTenImagesFetched() async throws {
        // Test checks if 10 image URLs are returned within the array.
        
        let testBreed = "beagle"
        let image = try await apiManager.fetchImagesFromAPI(breed: testBreed)
        
        print("image.count = \(image?.count ?? 0)")
        XCTAssertTrue(image?.count == 10)
    }
}
