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

  var body: some View {
    // The normal (behind the sheet) view content belongs here
    NormalContent()
      .overlay(
        SnapSheet {
          // The content shown on the sheet belongs here
        }
      )
  }
}
```

### Additional functions
```Swift
import SwiftUI
import SnapSheet

struct ContentView: View {
  @State var state: SnapSheetState = .small

  var body: some View {
    // The normal (behind the sheet) view content belongs here
    NormalContent()
      .overlay(
        SnapSheet($state, smallHeight: 100, middleHeight: 400, largeHeight: 800) {
          // The content shown on the sheet belongs here
        }
        .ignoresSafeArea()
        .background(.white)
      )
  }
}
```

- **Set snap heights:** Set the snap small, middle and large heights the sheet snaps for
```Swift 
init(
  smallHeight: CGFloat = UIScreen.main.bounds.size.height * 0.1,
  middleHeight: CGFloat = UIScreen.main.bounds.size.height * 0.4,
  largeHeight: CGFloat = UIScreen.main.bounds.size.height * 0.78,
  @ViewBuilder content: () -> Content)
```
- **Snap state Binding:** Make the state of the sheet visible and changable from outside
```Swift 
init(
  _ state: Binding<SnapSheetState> = .constant(.small),
  @ViewBuilder content: () -> Content)
```
- **Ignore safe area:** Allows content of snap sheet to overlap the area of the home bar
```Swift
func ignoresSafeArea() -> some View
```
- **Background color:** Changes the background color of the snap sheet
```Swift
func background(_ color: Color) -> some View
```

## Installation
### Swift Package Manager
- Add Package: https://github.com/ionas-dev/SnapSheet.git

## Example Footage
https://github.com/ionas-dev/SnapSheet/assets/60469464/09f9d72e-4be0-45be-bbed-814a9c7c0c28
