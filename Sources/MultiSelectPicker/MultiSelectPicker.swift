// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

/// A custom multi-select picker using a modal sheet to present options.
///
/// - Available on iOS 16.0 and above.
///
@available(iOS 16.0, *)
public struct MultiSelectPicker: View {
    public var title: String
    @Binding public var options: [FormOption]
    public var preSelected: [FormOption]
    public var onDone: ((Set<FormOption>) -> Void)? = nil

    @StateObject private var viewModel: MultiSelectPickerViewModel
    @State private var showOptionsSheet = false

    public init(
        title: String,
        options: Binding<[FormOption]>,
        preSelected: [FormOption] = [],
        onDone: ((Set<FormOption>) -> Void)? = nil
    ) {
        self.title = title
        self._options = options
        self.preSelected = preSelected
        self.onDone = onDone
        _viewModel = StateObject(wrappedValue: MultiSelectPickerViewModel(
            options: options.wrappedValue,
            preSelected: preSelected
        ))
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Button {
                showOptionsSheet.toggle()
            } label: {
                HStack {
                    Text(viewModel.selectedOptions.isEmpty ? title :
                         viewModel.selectedOptions.map { $0.label }.joined(separator: ", "))
                        .accessibilityLabel(accessibilityLabelText)
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .accessibilityElement(children: .combine)

            .sheet(isPresented: $showOptionsSheet) {
                OptionsSelectionSheet(
                    allOptions: viewModel.filteredOptions,
                    title: title,
                    selectedIDs: $viewModel.selectedIDs,
                    searchText: $viewModel.searchText,
                    onToggle: { option in
                        viewModel.toggleSelection(option)
                    },
                    onClear: {
                        viewModel.clearSelection()
                    },
                    onDone: {
                        showOptionsSheet = false
                        options = viewModel.allOptions
                        onDone?(viewModel.selectedOptions)
                    }
                )
                .presentationDetents([.medium])
            }
        }
    }

    private var accessibilityLabelText: String {
        viewModel.selectedOptions.isEmpty
            ? title
            : "Selected: \(viewModel.selectedOptions.map { $0.label }.joined(separator: ", "))"
    }
}
