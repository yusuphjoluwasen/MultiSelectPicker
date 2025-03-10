// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

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

public class FormOption: Hashable, Identifiable, Equatable {
    var label: String
    var value: String?
    var uid: String?
    public var id: String = UUID().uuidString
    var isSelected: Bool = false
    
    public static func == (lhs: FormOption, rhs: FormOption) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public init(label: String, value: String? = nil, uid:String? = nil, isSelected: Bool = false) {
        self.label = label
        self.value = value
        self.uid = uid
        self.isSelected = isSelected
    }
}
