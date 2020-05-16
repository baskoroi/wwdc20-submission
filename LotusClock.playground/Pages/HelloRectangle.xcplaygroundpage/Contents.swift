/*: [Previous](@previous)

# Hello, Rectangle!

 If you notice the lotus clock, it's a square-like, with some rounded corners. In SwiftUI, we call this a `RoundedRectangle`. So we'll make one, right above the Hello text!
 
 One catch: A `Text` is a view. A `RoundedRectangle` view. SwiftUI can't contain two views or more at the same time inside `var body: some View {...}`.
 
So a trick to get them shown is by grouping them views, or _stacking_: use `HStack` (stack left to right), `VStack` (top to bottom), or `ZStack` (front to back). This way, SwiftUI thinks you only have _one_ `View` to show.

## Goal
* Callout(Stack 'em all!):
  * Show a rectangle, i.e. `RoundedRectangle`, above the Hello text.
  * Set the `cornerRadius` first! The higher it is, the bigger the rounded curve; the lower, the smaller.
*/
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        VStack {
            // GO: replace below gray placeholder with our cornerRadius above! Do it right, and the yellow warning will go away...
            RoundedRectangle(cornerRadius: <#T##CGFloat#>)
            Text("Hello SwiftUI!")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
/*:
 By now, we should've seen a huge black rounded rectangle. This is because we haven't set the proper size and positioning. It's okay, let's tidy it up now... 😝
 
 [Next: Slay the giant!](@next)
 */
