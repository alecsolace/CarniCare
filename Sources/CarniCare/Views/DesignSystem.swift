#if canImport(SwiftUI)
import SwiftUI

/// Design system for the CarniCare app with liquid glass aesthetic
public struct DesignSystem {
    
    // MARK: - Colors
    public struct Colors {
        /// Sage green color palette
        public static let sageGreen = Color(red: 0.58, green: 0.73, blue: 0.63) // Primary sage green
        public static let lightSage = Color(red: 0.85, green: 0.91, blue: 0.87) // Light sage for backgrounds
        public static let darkSage = Color(red: 0.34, green: 0.52, blue: 0.42)  // Dark sage for text
        public static let accentSage = Color(red: 0.45, green: 0.65, blue: 0.52) // Accent sage
        
        /// Glass effect colors
        public static let glassBackground = Color.white.opacity(0.1)
        public static let glassBorder = Color.white.opacity(0.2)
        public static let glassHighlight = Color.white.opacity(0.3)
        
        /// Text colors
        public static let primaryText = Color.primary
        public static let secondaryText = Color.secondary
        public static let lightText = Color.white
        
        /// Care level colors
        public static let beginnerGreen = Color.green
        public static let intermediateYellow = Color.yellow
        public static let advancedOrange = Color.orange
        public static let expertRed = Color.red
    }
    
    // MARK: - Typography
    public struct Typography {
        public static let title = Font.largeTitle.bold()
        public static let headline = Font.headline.weight(.semibold)
        public static let subheadline = Font.subheadline.weight(.medium)
        public static let body = Font.body
        public static let caption = Font.caption
        public static let footnote = Font.footnote
    }
    
    // MARK: - Spacing
    public struct Spacing {
        public static let xs: CGFloat = 4
        public static let sm: CGFloat = 8
        public static let md: CGFloat = 16
        public static let lg: CGFloat = 24
        public static let xl: CGFloat = 32
        public static let xxl: CGFloat = 48
    }
    
    // MARK: - Corner Radius
    public struct CornerRadius {
        public static let sm: CGFloat = 8
        public static let md: CGFloat = 12
        public static let lg: CGFloat = 16
        public static let xl: CGFloat = 20
    }
    
    // MARK: - Shadows
    public struct Shadows {
        public static let soft = Color.black.opacity(0.1)
        public static let medium = Color.black.opacity(0.15)
        public static let strong = Color.black.opacity(0.25)
    }
}

// MARK: - View Modifiers
public extension View {
    /// Applies liquid glass effect to a view
    func liquidGlass() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(DesignSystem.Colors.glassBackground)
                    .background(
                        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                            .stroke(DesignSystem.Colors.glassBorder, lineWidth: 1)
                    )
                    .shadow(color: DesignSystem.Shadows.soft, radius: 10, x: 0, y: 5)
            )
            .backdrop(blur: 10)
    }
    
    /// Applies frosted glass background
    func frostedGlass() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(.ultraThinMaterial)
                    .background(DesignSystem.Colors.lightSage.opacity(0.3))
            )
    }
    
    /// Backdrop blur effect
    func backdrop(blur radius: CGFloat) -> some View {
        self.background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .blur(radius: radius)
                .opacity(0.8)
        )
    }
    
    /// Sage green gradient background
    func sageGradient() -> some View {
        self.background(
            LinearGradient(
                colors: [
                    DesignSystem.Colors.lightSage,
                    DesignSystem.Colors.sageGreen.opacity(0.7)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
#endif