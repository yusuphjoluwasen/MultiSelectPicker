# SwiftUI MultiSelectPicker

A custom MultiSelect Picker in SwiftUI that allows users to select multiple options.

<p align="center">
  <img src="https://github.com/user-attachments/assets/afbc3ec1-ec20-41d8-b950-2743c6a4cace" alt="An Image showing the MultiSelect Picker works">
</p>

## Installation

You can integrate the `MultiSelectPicker` into your SwiftUI project using Swift Package Manager.

To install, add the following to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/yusuphjoluwasen/MultiSelectPicker.git", from: "1.0.0")
```

## Usage
```swift
 MultiSelectPicker(title: "Hobbies", options: $options)
                .padding()
```

## Sample Usage
```swift
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
            MultiSelectPicker(title: "Hobbies", options: $options)
                .padding()
        }
    }
}
```

For a step-by-step guide on how to build the custom MultiSelect Picker, check out the tutorial:
https://jimohyusuph.hashnode.dev/building-a-custom-multiselect-picker-in-swiftui
