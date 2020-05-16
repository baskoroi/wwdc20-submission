/*:
[Previous: Hello (again), rectangle!](@previous)
 
# May the clock breathe! 𑁍

The moment you've been waiting for: our lotus clock.
 
You know what to do: add it and make it run. How? Check the goals below!
 
## Goal

We have provided you:
 * Add `BreathingClock` object into our `ContentView`.
 * `Combine` library imported, to connect our smaller views from `ContentView` with our `BreathingClock` instance (and vice versa!)
 
* Callout(So, all you need to do is...):
  * Set 4 cycles for our lotus clock
  * Run this and make you've got 4 cycles ticking!
  * If it's running well, breathe...
 
 You don't need to complete 4 cycles of breathing. As long as the clock runs, go to next page!
 
## Box breathing recap

 If you see there, we have the inner green area growing and shrinking. Here are the steps for box breathing.
   1. Inhale (inner green area growing)
   2. Hold (inner green area stops growing)
   3. Exhale (outer green area shrinking)
   4. Hold (outer green area shrinking)
 
*/
import SwiftUI
import Combine
import PlaygroundSupport

struct ContentView: View {
    
    // GO: set maxSeconds to 64 (4 cycles)
    @ObservedObject var clock = BreathingClock(maxSeconds: 64)
    
    var body: some View {
        VStack {
            Spacer()
            LotusView(clock: clock) // here's the clock object from above
            Spacer()
            Text(clock.status).font(.title)
            Spacer()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

/*:
 If you see that the timer is running well, cilck Next below.
 [Next: Mission status, please?!](@next)
 */
