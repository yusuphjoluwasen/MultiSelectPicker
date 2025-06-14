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

    @StateObject private var viewModel: MultiSelectPickerViewModel
    @State private var showOptionsSheet = false

    public init(
        title: String,
        options: Binding<[FormOption]>,
        preSelected: [FormOption] = []
    ) {
        self.title = title
        self._options = options
        _viewModel = StateObject(wrappedValue: MultiSelectPickerViewModel(options: options.wrappedValue, preSelected: preSelected))
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Button {
                showOptionsSheet.toggle()
            } label: {
                HStack {
                    Text(viewModel.selectedOptions.isEmpty ? title :
                         viewModel.selectedOptions.map { $0.label }.joined(separator: ", "))
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .sheet(isPresented: $showOptionsSheet) {
                OptionsSelectionSheet(
                    allOptions: viewModel.allOptions,
                    title: title,
                    selectedIDs: viewModel.getSelectedLabels(),
                    onToggle: { option in
                        viewModel.toggleSelection(option)
                    },
                    onDone: {
                        showOptionsSheet = false
                    }
                )
                .presentationDetents([.medium])
            }
        }
        .onDisappear {
            options = viewModel.allOptions
        }
    }
}
