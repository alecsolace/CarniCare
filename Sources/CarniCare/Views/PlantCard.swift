#if canImport(SwiftUI)
import SwiftUI

/// A beautiful card displaying plant information with liquid glass aesthetic
public struct PlantCard: View {
    let plant: Plant
    
    public init(plant: Plant) {
        self.plant = plant
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            // Plant image placeholder with glass overlay
            ZStack {
                Rectangle()
                    .fill(DesignSystem.Colors.lightSage.opacity(0.3))
                    .frame(height: 160)
                    .overlay(
                        // Placeholder image with plant icon
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 40))
                            .foregroundColor(DesignSystem.Colors.sageGreen)
                    )
                
                // Glass overlay effect
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        careLevelBadge
                    }
                    .padding(DesignSystem.Spacing.sm)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.md))
            
            // Plant information
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                // Plant name
                Text(plant.name)
                    .font(DesignSystem.Typography.headline)
                    .foregroundColor(DesignSystem.Colors.darkSage)
                    .lineLimit(2)
                
                // Scientific name
                Text(plant.scientificName)
                    .font(DesignSystem.Typography.caption)
                    .foregroundColor(DesignSystem.Colors.secondaryText)
                    .italic()
                
                // Plant description
                Text(plant.description)
                    .font(DesignSystem.Typography.body)
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                // Care information
                careInfoSection
            }
            .padding(.horizontal, DesignSystem.Spacing.md)
            .padding(.bottom, DesignSystem.Spacing.md)
        }
        .background(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                .fill(.ultraThinMaterial)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                        .fill(DesignSystem.Colors.lightSage.opacity(0.2))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                        .stroke(DesignSystem.Colors.glassBorder, lineWidth: 1)
                )
        )
        .shadow(color: DesignSystem.Shadows.soft, radius: 8, x: 0, y: 4)
    }
    
    private var careLevelBadge: some View {
        Text(plant.careLevel.rawValue)
            .font(DesignSystem.Typography.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, DesignSystem.Spacing.sm)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial)
                    .background(
                        Capsule()
                            .fill(careLevelColor.opacity(0.8))
                    )
            )
            .foregroundColor(.white)
    }
    
    private var careLevelColor: Color {
        switch plant.careLevel {
        case .beginner:
            return DesignSystem.Colors.beginnerGreen
        case .intermediate:
            return DesignSystem.Colors.intermediateYellow
        case .advanced:
            return DesignSystem.Colors.advancedOrange
        case .expert:
            return DesignSystem.Colors.expertRed
        }
    }
    
    private var careInfoSection: some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            careInfoRow(icon: "drop.fill", title: "Watering", info: plant.wateringFrequency)
            careInfoRow(icon: "sun.max.fill", title: "Light", info: plant.lightRequirement)
            careInfoRow(icon: "humidity.fill", title: "Humidity", info: plant.humidity)
            careInfoRow(icon: "thermometer", title: "Temperature", info: plant.temperature)
        }
        .padding(DesignSystem.Spacing.sm)
        .background(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                .fill(DesignSystem.Colors.glassBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                        .stroke(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
                )
        )
    }
    
    private func careInfoRow(icon: String, title: String, info: String) -> some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image(systemName: icon)
                .foregroundColor(DesignSystem.Colors.accentSage)
                .frame(width: 16)
            
            Text(title)
                .font(DesignSystem.Typography.footnote)
                .fontWeight(.medium)
                .foregroundColor(DesignSystem.Colors.darkSage)
                .frame(width: 80, alignment: .leading)
            
            Text(info)
                .font(DesignSystem.Typography.footnote)
                .foregroundColor(DesignSystem.Colors.primaryText)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}
#endif