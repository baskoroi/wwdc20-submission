import Foundation

// BreathingState represents the steps used in each cycle of box breathing
public enum BreathingState {
    case nonBoxBreathing
    case inhale
    case holdAfterInhale
    case exhale
    case holdAfterExhale
}
