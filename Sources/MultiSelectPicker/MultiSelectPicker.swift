// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

/// A custom multi-select picker using a modal sheet to present options.
///
/// - Available on iOS 16.0 and above.
///
@available(iOS 16.0, *)
public struct MultiSelectPicker: View {
    public var title:String
    @Binding public var options: [FormOption]
    //use for internal display of selected items
    @State private var selectedOptions: Set<FormOption> = []
    @State private var showOptionsSheet = false
    
    public init(
        title: String,
        options: Binding<[FormOption]>
    ) {
        self.title = title
        self._options = options
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                showOptionsSheet.toggle()
            }) {
                VStack {
                    HStack {
                        Text(selectedOptions.isEmpty ? title : selectedOptions.map { $0.label }.joined(separator: ", "))
                        Spacer()
                        Image("menuindicator", bundle: .module)
                    }
                }
                .frame(alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
            }
            .sheet(isPresented: $showOptionsSheet) {
                OptionsSelectionSheet(
                    options: options, title: title,
                    selectedOptions: $selectedOptions,
                    sheetIsOpen: $showOptionsSheet
                )
                .presentationDetents([.medium])
            }
            
        }
        .onAppear{
            // This ensures that items initially marked as selected
            // are automatically pre-selected when the view appears.
            // Remove this line if you do not support pre-selection.
            selectedOptions = Set(options.filter { $0.isSelected })
        }
    }
}

