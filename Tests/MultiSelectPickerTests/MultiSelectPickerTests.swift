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
    
    func makeOption(label: String, isSelected: Bool = false) -> FormOption {
        return FormOption(label: label, isSelected: isSelected)
    }
    
    @MainActor func testInitializationOptions() {
        let option1 = makeOption(label: "Option 1", isSelected: true)
        let option2 = makeOption(label: "Option 2", isSelected: false)
        var options = [option1, option2]
        
        let binding = Binding(get: { options }, set: { options = $0 })
        
        let picker = MultiSelectPicker(title: "Select Options", options: binding)
        
        XCTAssertTrue(picker.options.contains(option1), "Option list should contain option 1")
        XCTAssertTrue(picker.options.contains(option2), "Option list should conatin option 2")
        XCTAssertTrue(picker.options.first?.label == "Option 1")
        XCTAssertTrue(picker.options.first?.isSelected == true)
    }
    
}
