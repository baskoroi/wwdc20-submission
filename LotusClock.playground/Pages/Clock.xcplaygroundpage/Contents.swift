/*:
[Previous: The giant is slain!](@previous)
 
# May the clock breathe! 𑁍

The moment you've been waiting for: our __lotus clock__.

We provide here:
 
* `BreathingClock` object in `ContentView`, to count the cycles/steps;
* `LotusView`, to animate the lotus clock; and
* The `Combine` library, for our `BreathingClock` to communicate with our `LotusView` and `Text`.

## Goal
 
* Callout(The final countdown...):
  * Run to ensure the clock is running well.
 
 For first try: don't wait for 4 cycles. No need to breathe along.
 
 Now what matters is, whether the lotus clock animates... 😉
*/
import SwiftUI
import Combine
import PlaygroundSupport

struct ContentView: View {

    // You can set to any #seconds later.
    // @ObservedObject helps this view to receive timing & status updates
    @ObservedObject var clock = BreathingClock(maxSeconds: 64)
    
    var body: some View {
        VStack {
            Spacer()
            
            // this replaces our rounded rectangle
            // here we use the above clock object
            LotusView(clock: clock)
            
            Spacer()
            
            // this replaces our Hello text
            // we show the clock's status, with larger font
            Text(clock.status).font(.title)
            
            Spacer()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next: Mission status, please?!](@next)
