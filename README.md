# 🗄️ SnapSheet
![SnapSheet Title Image](https://github.com/ionas-dev/SnapSheet/assets/60469464/af8ffb80-2dfc-4eb0-826c-32b85bb42c99)

A native looking snap sheet/drawer component. 
Written in SwiftUI and behaves like you'd imagine any SwiftUI component to work.

In the past I've used [Snap](https://github.com/nerdsupremacist/Snap), but wanted to make one on my own.


## Usage
```Swift
import SwiftUI
import SnapSheet

struct ContentView: View { 
  @State var state: SnapSheetState = .small

  var body: some View {
    // The normal (behind the sheet) view content belongs here
    NormalContent()
      .overlay(
        SnapSheet($state) {
          // The content shown on the sheet belongs here
          SheetContent()
        }
      )
  }
}
```

## Installation
### Swift Package Manager
- Add Package: https://github.com/ionas-dev/SnapSheet.git

## Example Footage
https://github.com/ionas-dev/SnapSheet/assets/60469464/09f9d72e-4be0-45be-bbed-814a9c7c0c28
