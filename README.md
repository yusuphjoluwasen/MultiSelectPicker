# SwiftUI MultiSelectPicker

A custom MultiSelect Picker in SwiftUI that allows users to select multiple options.

[![Click to see how it works](https://github.com/user-attachments/assets/9608c9f2-f0fa-40c3-9a8c-512efccbc5e9)](https://youtube.com/shorts/QZwxrJwSoU8)

**Click the image to see how it works**

## Installation

You can integrate the `MultiSelectPicker` into your SwiftUI project using Swift Package Manager.

To install, add the following to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/yusuphjoluwasen/MultiSelectPicker.git", from: "1.0.0")
```

##Usage
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
