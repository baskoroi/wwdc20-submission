/*:
 [Previous: Hello (again), rectangle!](@previous)
 
 # Shrink the giant! 🦕

 We have two issues: the rectangle is darn huge, and there's not enough _space_. That's why we're here!
 
 Don't forget to set size for our `RoundedRectangle` before giving some... space.
 
 To squeeze the SwiftUI views in a _stack_, we can use a bunch of `Spacer`s. As the name says, it adds space between `View`s.

 ## Goal
 * Callout(Tidy, tidy, tidy...):
   * Set size of our `RoundedRectangle` using `.frame(...)` modifier.
   * Add `Spacer()` before and after the rounded rectangle and Hello text.
 
 You may be wondering: where's the lotus clock? This here is all the basics needed for us to add our lotus clock.
 
 And the good news? You'll do it in only _one_ page after this!
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    // GO: set this to 240
    let sideLength: CGFloat = 240
    
    var body: some View {
        VStack {
            // here's an example Spacer, add two more in next comments
            Spacer()
            
            RoundedRectangle(cornerRadius: 32)
                .frame(width: sideLength, height: sideLength, alignment: .center)
            
            // GO: add Spacer() here
            
            Text("Hello, world!")
            
            // GO: add Spacer() here
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next: Where's my clock, _btw_?!](@next)
