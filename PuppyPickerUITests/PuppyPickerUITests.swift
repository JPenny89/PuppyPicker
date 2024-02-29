//
//  PuppyPickerUITests.swift
//  PuppyPickerUITests
//
//  Created by James Penny on 01/02/2024.
//

import XCTest

final class PuppyPickerUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_searchfield() {
        // Test to confirm if "Basset Hound" is returned when "Hound" is typed into the search field.
        
        let breedListNavigationBar = app.navigationBars["Breed List"].searchFields["Search Breed"]
        breedListNavigationBar.tap()
        breedListNavigationBar.typeText("Hound")
        
        XCTAssertTrue(app.collectionViews["Sidebar"].buttons["Basset Hound"].exists)
    }
    
    func test_ten_images_returned() {
        // Test checks if 10 images are returned.
        
        let lazyvgridLabelElement = app.scrollViews["Scrollview label"].otherElements.otherElements["LazyVGrid label"]
        app.collectionViews["Sidebar"].buttons.firstMatch.tap()
        
        print("Image count = \(lazyvgridLabelElement.buttons.count)")
        XCTAssertTrue(lazyvgridLabelElement.buttons.count == 10)
  
    }
    
    func test_find_more_button() {
        //Tests if button is visible and can be tapped
        
        let findButton = app.buttons["findMoreButton"]
        let lazyvgridLabelElement = app.scrollViews["Scrollview label"].otherElements.otherElements["LazyVGrid label"]
        app.collectionViews["Sidebar"].buttons.firstMatch.tap()
        lazyvgridLabelElement.buttons.firstMatch.tap()
        
        // Identifies button
        XCTAssertTrue(findButton.isHittable)
        
        findButton.tap()
        
        // Check button is no longer visible once tapped.
        XCTAssertFalse(findButton.exists)
    }
}
