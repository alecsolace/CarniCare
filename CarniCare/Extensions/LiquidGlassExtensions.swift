import SwiftUI

// MARK: - Color Extensions for iOS 26 Sage Green Palette
extension Color {
    static let sageGreen = Color(red: 0.55, green: 0.65, blue: 0.55)
    static let sageGreenLight = Color(red: 0.75, green: 0.82, blue: 0.75)
    static let sageGreenDark = Color(red: 0.35, green: 0.45, blue: 0.35)
    static let liquidGlassBackground = Color(red: 0.95, green: 0.97, blue: 0.95, opacity: 0.2)
    static let frostedGlass = Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1)
}

// MARK: - Liquid Glass View Modifier
struct LiquidGlassEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.sageGreenLight.opacity(0.1),
                                        Color.sageGreen.opacity(0.05),
                                        Color.sageGreenDark.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.sageGreenLight.opacity(0.3),
                                        Color.sageGreen.opacity(0.1),
                                        Color.sageGreenDark.opacity(0.2)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    }
            }
    }
}

// MARK: - Expanding Card Animation
struct ExpandingCardModifier: ViewModifier {
    let isExpanded: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isExpanded ? 1.02 : 1.0)
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isExpanded)
    }
}

// MARK: - View Extensions
extension View {
    func liquidGlass() -> some View {
        modifier(LiquidGlassEffect())
    }
    
    func expandingCard(isExpanded: Bool) -> some View {
        modifier(ExpandingCardModifier(isExpanded: isExpanded))
    }
}