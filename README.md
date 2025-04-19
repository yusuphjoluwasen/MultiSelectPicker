# SwiftUI MultiSelectPicker

A MultiSelect Picker for selecting multiple options, designed to feel as close as possible to the native SwiftUI Picker.

<p align="center">
  <img src="https://github.com/user-attachments/assets/afbc3ec1-ec20-41d8-b950-2743c6a4cace" alt="An Image showing the MultiSelect Picker works">
</p>

## Current Features
- [x] Multi-select support
- [x] Customizable title
- [x] Two-way binding — Automatically updates selected options
- [x] Lightweight — Minimal code with clean and reusable SwiftUI components.
- [x] Light and Dark Mode 
- [ ] Search — Add a search bar to filter options.
- [ ] Custom Styling — Support for custom colors, and styles.
- [ ] Accessibility Improvements.
- [ ] Localizations.

## Installation

You can integrate the `MultiSelectPicker` into your SwiftUI project using Swift Package Manager.

To install, add the following to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/yusuphjoluwasen/MultiSelectPicker.git", from: "1.0.0")
```

## Usage
```swift
 MultiSelectPicker(title: "Hobbies", options: $options)
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


## Run the Example

To try the component locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yusuphjoluwasen/MultiSelectPicker.git
   
2. **Open the project in Xcode:**

   ```bash
   cd MultiSelectPicker
   open MultiSelectPicker.xcodeproj

3. **Build and run** the `Example` target to see the picker in action.

> Make sure you're using **Xcode 14 or later** and targeting **iOS 16 or above**.


## Contributing to MultiSelectPicker
We love contributions from the community, Whether it's fixing a bug, improving performance, adding features, or enhancing documentation, your help is welcome.

### How To Contribute
- Look for issues on the Issues tab
- Comment on the issue to get assigned to it.
- Fork the repository on GitHub.
- Once you are done with changes, Create a Pull Request (PR) on and describe the changes.
- Add screenshots or images of any UI changes in your PR
- Ensure changes meet acceptance criteria stated in the issue

#### You can also file an issue to request a feature or report a bug you come across. Thanks!

## 📜 License
This project is licensed under the MIT License — meaning you can use, modify, and distribute it freely.



