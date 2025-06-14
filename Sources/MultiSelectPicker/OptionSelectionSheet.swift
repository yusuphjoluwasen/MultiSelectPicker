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
    var selectedIDs: Set<String>
    var onToggle: (FormOption) -> Void  
    var onDone: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.secondary)
                Spacer()
                Button("Done") {
                    onDone()
                }
            }
            .padding()

            List(allOptions, id: \.id) { option in
                MultipleSelectionRow(
                    option: option,
                    isSelected: selectedIDs.contains(option.id),
                    onTap: {
                        onToggle(option)
                    }
                )
            }
            .listStyle(.plain)
        }
    }
}

@available(iOS 13.0, *)
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
    }
}


