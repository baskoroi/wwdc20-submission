/*:
 [Previous: Hello (again), rectangle!](@previous)
 
 # Shrink the giant! 🦕
 
 Modifiers change how a View looks and behaves.
 
 To shrink the rounded rectangle,  we can set the size for the `RoundedRectangle` using its `.frame(width:height:alignment)` modifier.
 
 `Spacer`s also add space between `View`s. Without them, the Views will look compressed or mispositioned.

 ## Goal
 
 * Callout(Tidy, tidy, tidy...):
   * Add `Spacer()`s after the rounded rectangle and Hello text.
   * The rectangle size has been set for you.
 
 You may be wondering: where's the lotus clock?
 
 Next page. This here's all the basics needed.
 */
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    let size: CGFloat = 240
    
    var body: some View {
        VStack {
            
            // here's an example Spacer, add two more below next comments
            Spacer()
        
            RoundedRectangle(cornerRadius: 32)
                .frame(width: size, height: size, alignment: .center)
            
            // GO: add Spacer() here
            
            Text("Hello, world!")
            
            // GO: add Spacer() here
            
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next: Where's my clock, _btw_?!](@next)
