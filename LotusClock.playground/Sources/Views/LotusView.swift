import SwiftUI

public struct LotusView: View {
    @ObservedObject var clock: BreathingClock
    
    public init(clock: BreathingClock) {
        self.clock = clock
    }
    
    private let outerLotusColor = Color.rgb(72, 150, 120)
    private let innerLotusColor = Color.rgb(84, 204, 167)
    
    @State private var lotusSize: Double = 0.6
    private let minLotusSize = 0.6
    private let maxLotusSize = 0.85
    private let lotusRadius = CGFloat(36)
    
    // grow inner lotus for inhale
    private func growLotus() {
        withAnimation(
            Animation.easeOut(
                duration: self.clock.secondsPerStep)) {
                    self.lotusSize = self.maxLotusSize
                }
    }
    
    // shrink inner lotus for exhale
    private func shrinkLotus() {
        withAnimation(
            Animation.easeOut(
                duration: self.clock.secondsPerStep)) {
                    self.lotusSize = self.minLotusSize
                }
    }
    
    // animation closure for scale effect in lotus, as per  breathing clock
    private func animateLotusByClock() {
        // reorganize / remove redudant `self.clock.*`
        // references within closure
        let clock = self.clock
        
        // since Timer has initial delay for `timeInterval` seconds,
        // thus to avoid delayed inhale, growing the lotus must be
        // done manually before the setup
        self.growLotus()
        clock.nextBreathingStep()
        
        // set up animation sequence: inhale - hold - exhale - hold
        clock.setupTimer { _ in
            
            if clock.isPastMaxSeconds {
                clock.stopTimer()
                // set string here (not in class), so it
                // can be 'published' to ContentView
                clock.status = "Finished!"
            }
            
            switch clock.breathingState {
            
            // inhale - grow lotus to max size
            case .inhale:
                // new inhale = start of new cycle
                clock.startNewCycle()
                self.growLotus()
                
            // exhale - shrink lotus to min size
            case .exhale:
                self.shrinkLotus()
                
            // hold breath
            default:
                break
            }
                
            clock.nextBreathingStep()
        }
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: lotusRadius)
            .foregroundColor(innerLotusColor)
            .scaleEffect(CGFloat(lotusSize))
            .onAppear(perform: animateLotusByClock)
            .frame(width: 240, height: 240, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: lotusRadius)
                    .foregroundColor(outerLotusColor))
    }
}
