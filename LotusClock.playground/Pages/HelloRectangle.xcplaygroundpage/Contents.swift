/*: [Previous: Hi SwiftUI!](@previous)

# Hello, "rounded rectangle"? ☎️
 
 We'll insert a `RoundedRectangle` above the Hello `Text`.
 
 ## One catch
 
 `ContentView` in SwiftUI _cannot contain_ more than one `View`.
 
 A `Text` and a `RoundedRectangle`? Considered as two.

## Goal
 
Group those two `View`s into one with _stacking_. We can use:
* `HStack` (stack left to right),
* `VStack` (top to bottom), or
* `ZStack` (front to back).
 
* Callout(Stack 'em all!):
  * Run to see the rectangle and text vertically aligned.
*/
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        // rectangle should be above text
        VStack {
            RoundedRectangle(cornerRadius: 36)
            Text("Hello SwiftUI!")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
/*:
 Whoops! There's a huge black rounded rectangle.
 
 Don't worry: we'll set the proper size and positioning.
  
 [Next: Slay thine giant!](@next)
 */
