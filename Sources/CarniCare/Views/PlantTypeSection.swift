#if canImport(SwiftUI)
import SwiftUI

/// Expandable section for a plant type with liquid glass aesthetic
public struct PlantTypeSection: View {
    let plantType: PlantType
    let plants: [Plant]
    @State private var isExpanded: Bool = false
    
    public init(plantType: PlantType, plants: [Plant]) {
        self.plantType = plantType
        self.plants = plants
    }
    
    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            // Section header
            sectionHeader
            
            // Expandable content
            if isExpanded {
                LazyVGrid(columns: gridColumns, spacing: DesignSystem.Spacing.md) {
                    ForEach(plants) { plant in
                        PlantCard(plant: plant)
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
                .transition(.asymmetric(
                    insertion: .scale.combined(with: .opacity),
                    removal: .scale.combined(with: .opacity)
                ))
            }
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isExpanded)
    }
    
    private var sectionHeader: some View {
        Button(action: {
            withAnimation {
                isExpanded.toggle()
            }
        }) {
            HStack(spacing: DesignSystem.Spacing.md) {
                // Plant type icon
                ZStack {
                    Circle()
                        .fill(DesignSystem.Colors.sageGreen.opacity(0.2))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: plantTypeIcon)
                        .font(.title2)
                        .foregroundColor(DesignSystem.Colors.sageGreen)
                }
                
                // Plant type information
                VStack(alignment: .leading, spacing: 4) {
                    Text(plantType.displayName)
                        .font(DesignSystem.Typography.headline)
                        .foregroundColor(DesignSystem.Colors.darkSage)
                    
                    Text(plantType.description)
                        .font(DesignSystem.Typography.subheadline)
                        .foregroundColor(DesignSystem.Colors.secondaryText)
                        .lineLimit(2)
                    
                    Text("\(plants.count) plant\(plants.count == 1 ? "" : "s")")
                        .font(DesignSystem.Typography.caption)
                        .foregroundColor(DesignSystem.Colors.accentSage)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                // Expand/collapse indicator
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(DesignSystem.Colors.accentSage)
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isExpanded)
            }
            .padding(DesignSystem.Spacing.md)
            .background(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(.ultraThinMaterial)
                    .background(
                        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        DesignSystem.Colors.lightSage.opacity(0.3),
                                        DesignSystem.Colors.sageGreen.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                            .stroke(DesignSystem.Colors.glassBorder, lineWidth: 1)
                    )
            )
            .shadow(color: DesignSystem.Shadows.soft, radius: 6, x: 0, y: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var plantTypeIcon: String {
        switch plantType {
        case .venusFlytrap:
            return "scissors"
        case .pitcher:
            return "cup.and.saucer.fill"
        case .sundew:
            return "drop.circle.fill"
        case .butterwort:
            return "leaf.circle.fill"
        case .bladderwort:
            return "bubbles.and.sparkles.fill"
        case .cobra:
            return "tornado"
        }
    }
    
    private var gridColumns: [GridItem] {
        [
            GridItem(.flexible(), spacing: DesignSystem.Spacing.md),
            GridItem(.flexible(), spacing: DesignSystem.Spacing.md)
        ]
    }
}

#if DEBUG
struct PlantTypeSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.lg) {
                PlantTypeSection(
                    plantType: .venusFlytrap,
                    plants: Array(PlantData.samplePlants.filter { $0.type == .venusFlytrap })
                )
                
                PlantTypeSection(
                    plantType: .pitcher,
                    plants: Array(PlantData.samplePlants.filter { $0.type == .pitcher })
                )
            }
            .padding()
        }
        .background(DesignSystem.Colors.lightSage.opacity(0.1))
    }
}
#endif

#endif