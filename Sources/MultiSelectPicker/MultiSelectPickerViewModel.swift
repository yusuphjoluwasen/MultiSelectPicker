//
//  MultiSelectPickerViewModel.swift
//  MultiSelectPicker
//
//  Created by Guru King on 14/06/2025.
//
import SwiftUI
import Combine

@available(iOS 16.0, *)
@MainActor
public class MultiSelectPickerViewModel: ObservableObject {
    @Published var allOptions: [FormOption]
    @Published var selectedOptions: Set<FormOption>
    @Published var selectedIDs: Set<String>
    @Published var searchText: String = ""

    public init(options: [FormOption], preSelected: [FormOption] = []) {
        self.allOptions = options
        let preSelectedIDs = Set(preSelected.map { $0.id })
        let selected = options.filter { preSelectedIDs.contains($0.id) }

        self.selectedOptions = Set(selected)
        self.selectedIDs = preSelectedIDs
    }

    public var filteredOptions: [FormOption] {
        guard !searchText.isEmpty else { return allOptions }
        return allOptions.filter {
            $0.label.localizedCaseInsensitiveContains(searchText)
        }
    }

    public func toggleSelection(_ option: FormOption) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
            selectedIDs.remove(option.id)
        } else {
            selectedOptions.insert(option)
            selectedIDs.insert(option.id)
        }
    }

    public func clearSelection() {
        selectedOptions.removeAll()
        selectedIDs.removeAll()
    }

    public func getSelectedLabels() -> Set<String> {
        Set(selectedOptions.map(\.label))
    }
}
