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
    var options: [FormOption]
    var title:String
    @Binding var selectedOptions: Set<FormOption>
    @Binding var sheetIsOpen:Bool
    
    var body: some View {
        VStack{
            
            HStack{
                Text(title)
                    .foregroundColor(.secondary)
                Spacer()
                
                Button(action: {
                    sheetIsOpen = false
                }){
                    Text("Done")
                }
            }
            .padding()
            
            List(options, id: \.self) { option in
                MultipleSelectionRow(option: option, isSelected: option.isSelected) {
                    toggleSelection(for: option)
                }
                .onAppear{dump("\(option.isSelected)")}
            }
            .listStyle(.plain)
        }
    }
    
    private func toggleSelection(for option: FormOption) {
        option.isSelected.toggle()
        
        if option.isSelected {
            selectedOptions.insert(option)
        } else {
            selectedOptions.remove(option)
        }
    }
}

/// A row representing a single selectable item.

@available(iOS 13.0, *)
struct MultipleSelectionRow: View {
    var option: FormOption
    var isSelected: Bool
    var uid:String?
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

