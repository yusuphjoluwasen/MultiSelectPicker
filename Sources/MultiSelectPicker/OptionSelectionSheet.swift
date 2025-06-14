//
//  OptionSelectionSheet.swift
//  MultiSelectPicker
//
//  Created by Guru King on 19/04/2025.
//

import SwiftUI

/// A modal sheet view presenting a list of selectable options.
@available(iOS 16.0, *)
struct OptionsSelectionSheet: View {
    var allOptions: [FormOption]
    var title: String
    @Binding var selectedIDs: Set<String>
    @Binding var searchText: String
    var onToggle: (FormOption) -> Void
    var onClear: () -> Void
    var onDone: () -> Void
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allOptions, id: \.id) { option in
                    MultipleSelectionRow(
                        option: option,
                        isSelected: selectedIDs.contains(option.id),
                        onTap: { onToggle(option) }
                    )
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, prompt: "Search \(title.lowercased())")
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !selectedIDs.isEmpty {
                        Button("Clear") {
                            onClear()
                        }
                        .foregroundColor(.red)
                        .accessibilityLabel("Clear all selected options")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        onDone()
                    }
                    .accessibilityLabel("Close selection")
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct MultipleSelectionRow: View {
    var option: FormOption
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(option.label)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .accessibilityElement()
        .accessibilityLabel(option.label)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
        .accessibilityAddTraits(isSelected ? [.isButton, .isSelected] : .isButton)
    }
}
