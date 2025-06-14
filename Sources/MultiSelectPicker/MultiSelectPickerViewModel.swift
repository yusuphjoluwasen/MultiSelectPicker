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

    public init(options: [FormOption], preSelected: [FormOption] = []) {
        self.allOptions = options
        let preSelectedLabels = Set(preSelected.map { $0.label.lowercased() })

        let selected = options.filter { preSelectedLabels.contains($0.label.lowercased()) }
        self.selectedOptions = Set(selected)
        self.selectedIDs = Set(selected.map { $0.id })
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

    public func getSelectedLabels() -> Set<String> {
        Set(selectedOptions.map(\.label))
    }
}


