/*: [Previous: Intro to box breathing](@previous)

 # Hello, SwiftUI! 🐦
 
 SwiftUI is Apple's newest tool to create user interfaces on all Apple devices, with the same code: iPhone, iPad, Macs, Apple Watch, and even Apple TV.
 
 ## Goal
 Run the code to see some hello.
 */
import SwiftUI
import PlaygroundSupport

// the bare-bones code of SwiftUI projects
struct ContentView: View {   // your view name
    var body: some View {    // the main contents themselves
        
        Text("Hello, 🌎🌍🌏")
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next: Add something else!](@next)
