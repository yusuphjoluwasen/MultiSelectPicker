//
//  MultiSelectPickerTests.swift
//  MultiSelectPicker
//
//  Created by Guru King on 11/03/2025.
//

import XCTest
import SwiftUI
@testable import MultiSelectPicker

@available(iOS 16.0, *)
final class MultiSelectPickerTests: XCTestCase {
    
    @MainActor func testInitializationOptions() {
        // Arrange: Create pre-selected options
        let option1 = FormOption(label: "Option 1", value: "option1",isSelected: true)
        let option2 = FormOption(label: "Option 2", isSelected: false)
        let options = [option1, option2]
        
        // Act: Create the picker
        let picker = MultiSelectPicker(title: "Select Options", options:  .constant(options))
        
        // Assert: Verify items conatin options
        XCTAssertTrue(picker.options.contains(option1), "Option list should contain option 1")
        XCTAssertTrue(picker.options.contains(option2), "Option list should conatin option 2")
        XCTAssertTrue(picker.options.first?.label == "Option 1")
        XCTAssertTrue(picker.options.first?.value == "option1")
        XCTAssertTrue(picker.options.first?.isSelected == true)
    }
    
}
