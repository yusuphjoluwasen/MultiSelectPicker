//
//  MultiSelectPickerTests.swift
//  MultiSelectPicker
//
//  Created by Guru King on 11/03/2025.
//

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

    let allOptions: [FormOption] = [
        FormOption(id: "1", label: "Option 1", value: "option1"),
        FormOption(id: "2", label: "Option 2", value: "option2"),
        FormOption(id: "3", label: "Option 3", value: "option3")
    ]

    let preSelected: [FormOption] = [
        FormOption(id: "2", label: "Option 2", value: "option2"),
        FormOption(id: "3", label: "Option 3", value: "option3")
    ]

    @MainActor
    func testViewModelInitializesWithPreSelectedIDs() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: preSelected)

        let selected = viewModel.selectedOptions
        XCTAssertEqual(selected.count, 2)
        XCTAssertTrue(selected.contains(where: { $0.id == "2" }))
        XCTAssertTrue(selected.contains(where: { $0.id == "3" }))
        XCTAssertFalse(selected.contains(where: { $0.id == "1" }))
    }

    @MainActor
    func testSelectedIDsMatchSelectedOptions() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: preSelected)

        XCTAssertEqual(viewModel.selectedIDs.count, 2)
        XCTAssertTrue(viewModel.selectedIDs.contains("2"))
        XCTAssertTrue(viewModel.selectedIDs.contains("3"))
        XCTAssertFalse(viewModel.selectedIDs.contains("1"))
    }

    @MainActor
    func testToggleSelectionWorksCorrectly() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: [])

        let option1 = allOptions[0]
        viewModel.toggleSelection(option1)

        XCTAssertTrue(viewModel.selectedOptions.contains(option1))
        XCTAssertTrue(viewModel.selectedIDs.contains(option1.id))

        viewModel.toggleSelection(option1)

        XCTAssertFalse(viewModel.selectedOptions.contains(option1))
        XCTAssertFalse(viewModel.selectedIDs.contains(option1.id))
    }

    @MainActor
    func testClearSelectionEmptiesAllSelected() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: preSelected)

        viewModel.clearSelection()

        XCTAssertTrue(viewModel.selectedOptions.isEmpty)
        XCTAssertTrue(viewModel.selectedIDs.isEmpty)
    }

    @MainActor
    func testGetSelectedLabelsReturnsCorrectSet() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: preSelected)

        let labels = viewModel.getSelectedLabels()
        XCTAssertEqual(labels, Set(["Option 2", "Option 3"]))
    }

    @MainActor
    func testNoCrashWithEmptyPreselection() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: [])
        XCTAssertTrue(viewModel.selectedOptions.isEmpty)
        XCTAssertTrue(viewModel.selectedIDs.isEmpty)
    }

    @MainActor
    func testFilteredOptionsMatchesSearchText() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: [])
        viewModel.searchText = "Option 2"

        let filtered = viewModel.filteredOptions
        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first?.label, "Option 2")
    }

    @MainActor
    func testFilteredOptionsIsAllWhenSearchEmpty() {
        let viewModel = MultiSelectPickerViewModel(options: allOptions, preSelected: [])
        viewModel.searchText = ""

        let filtered = viewModel.filteredOptions
        XCTAssertEqual(filtered.count, allOptions.count)
    }
}
