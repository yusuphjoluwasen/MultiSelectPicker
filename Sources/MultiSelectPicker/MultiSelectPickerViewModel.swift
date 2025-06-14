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

    public init(options: [FormOption], preSelected: [FormOption] = []) {
        self.allOptions = options
        let labelsToPreselect = Set(preSelected.map { $0.label.lowercased() })
        self.selectedOptions = Set(options.filter { labelsToPreselect.contains($0.label.lowercased()) })
    }

    public func toggleSelection(_ option: FormOption) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }
    }

    public func getSelectedLabels() -> Set<String> {
        Set(selectedOptions.map(\.label))
    }
}

