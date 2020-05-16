import SwiftUI

extension Color {
    // MARK: - convenience method to create color by RGB values
    public static func rgb(_ r: Double,
             _ g: Double,
             _ b: Double) -> Color {
        
        return Color(red: r/255, green: g/255, blue: b/255)
    }
}
