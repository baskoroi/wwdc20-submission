// NOTE FROM AUTHOR: DO NOT edit this class.
// If you want to edit, you can copy these .swift files somewhere else
// and edit from there.
// As for now, just read along how it works

import Foundation
import Combine

// BreathingClock counts the breathing cycles, and the current breathing
// state or step per cycle.
// It also stores status to be used in other views.
public class BreathingClock: ObservableObject {
    
    // MARK: - seconds configuration for the timer & step (inhale/exhale/hold)
    public init(maxSeconds: Double) {
        self.maxSeconds = maxSeconds
        self.setStatus()
    }
        
    @Published public var seconds: Double = 0
    public let secondsPerStep: Double = 4
    public var maxSeconds: Double = 0 // will be changed by this class' `init()`
    public var isPastMaxSeconds: Bool { seconds >= maxSeconds }
    
    // MARK: - publisher/subscriber pattern, used if an entire cycle has elapsed
    public let objectWillChange = ObservableObjectPublisher()
    // a cycle means: a full inhale-hold-exhale-hold sequence
    var cycles = 0 {
        willSet {
            objectWillChange.send()
        }
        didSet {
            self.setStatus()
        }
    }
    func remainingCycles() -> Int {
        let maxCycles = Int(
            maxSeconds / secondsPerStep / Double(breathingSequence.count)
        )
        return maxCycles - cycles
    }
    public var status = "Starting..." {
        willSet {
            objectWillChange.send()
        }
    }
    private func setStatus() {
        let cyclesToGo = remainingCycles()
        status = cyclesToGo == 1 ?
            "Last cycle!" : "\(cyclesToGo) cycles to go..."
    }
    
    // MARK: - Internal timer configuration
    @Published public var timer: Timer?
    public func setupTimer(action: @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(
            withTimeInterval: self.secondsPerStep,
            repeats: true,
            block: action
        )
    }
    public func stopTimer() {
        timer?.invalidate()
    }
    
    // MARK: - User logic: breathing steps per cycle
    private let breathingSequence: [BreathingState] = [
        .inhale,
        .holdAfterInhale, // after inhale
        .exhale,
        .holdAfterExhale, // after exhale
    ]
    private var index = 0
    public var breathingState: BreathingState {
        index >= 0 && index < breathingSequence.count ?
            breathingSequence[index] :
            .nonBoxBreathing
    }
    
    private func nextSequenceIndex() {
        guard seconds < maxSeconds else { return }
        
        index = (index + 1) % breathingSequence.count
    }
    
    private func elapseSecondsPerStep() {
        self.seconds += self.secondsPerStep
    }
    
    public func nextBreathingStep() {
        elapseSecondsPerStep()
        nextSequenceIndex()
    }
    
    // run when holdAfterExhale is completed
    // and the clock goes back to .inhale as current breathing state
    public func startNewCycle() {
        // if seconds = 0 --> there's still no elapsed cycle yet,
        // so no need to increment
        if seconds > 0 {
            cycles += 1
        }
    }
}
