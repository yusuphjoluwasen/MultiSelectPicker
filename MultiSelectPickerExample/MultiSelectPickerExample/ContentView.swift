//
//  ContentView.swift
//  MultiSelectPickerExample
//
//  Created by Guru King on 10/03/2025.
//
import SwiftUI
import MultiSelectPicker

struct ContentView: View {
    @State var options: [FormOption] = [
        FormOption(label: "Reading", value: "reading"),
        FormOption(label: "Traveling", value: "traveling"),
        FormOption(label: "Cooking", value: "cooking"),
        FormOption(label: "Gaming", value: "gaming")
    ]

    var body: some View {
        VStack {
            MultiSelectPicker(
                title: "Hobbies",
                options: $options,
                preSelected: [
                    FormOption(label: "Reading", value: "reading"),
                    FormOption(label: "Gaming", value: "gaming")
                ],onDone: { forms in
                    print(forms)
                }
            )
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
