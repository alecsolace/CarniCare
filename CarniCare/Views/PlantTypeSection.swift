import SwiftUI

struct PlantTypeSection: View {
    let plantType: PlantType
    let plants: [Plant]
    let isExpanded: Bool
    let onToggle: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            // Section Header
            Button(action: onToggle) {
                HStack {
                    Image(systemName: plantType.iconName)
                        .font(.title2)
                        .foregroundColor(.sageGreen)
                        .frame(width: 30)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(plantType.displayName)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("\(plants.count) plant\(plants.count == 1 ? "" : "s")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(.sageGreen)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.spring(response: 0.3), value: isExpanded)
                }
                .padding()
            }
            .liquidGlass()
            .expandingCard(isExpanded: isExpanded)
            
            // Expanded Content
            if isExpanded {
                LazyVStack(spacing: 8) {
                    ForEach(plants, id: \.id) { plant in
                        PlantCard(plant: plant)
                    }
                }
                .transition(.asymmetric(
                    insertion: .scale(scale: 0.8).combined(with: .opacity),
                    removal: .scale(scale: 0.8).combined(with: .opacity)
                ))
            }
        }
    }
}

struct PlantCard: View {
    let plant: Plant
    @State private var isHovered = false
    
    var body: some View {
        HStack(spacing: 16) {
            // Plant Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.sageGreenLight, Color.sageGreen],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                
                Image(systemName: plant.imageName)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            // Plant Info
            VStack(alignment: .leading, spacing: 4) {
                Text(plant.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(plant.scientificName)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
                
                HStack(spacing: 12) {
                    // Care Level Badge
                    HStack(spacing: 4) {
                        Circle()
                            .fill(careColor(for: plant.careLevel))
                            .frame(width: 8, height: 8)
                        Text(plant.careLevel.rawValue)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    // Sunlight Requirement
                    HStack(spacing: 4) {
                        Image(systemName: "sun.max.fill")
                            .font(.caption2)
                            .foregroundColor(.yellow)
                        Text(plant.sunlightRequirement.rawValue)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                
                // Watering Info
                Text("💧 \(plant.wateringFrequency)")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            // Expand indicator
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.sageGreen)
        }
        .padding()
        .liquidGlass()
        .scaleEffect(isHovered ? 1.02 : 1.0)
        .onTapGesture {
            withAnimation(.spring(response: 0.3)) {
                isHovered.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isHovered = false
                }
            }
        }
    }
    
    private func careColor(for level: CareLevel) -> Color {
        switch level {
        case .easy: return .green
        case .medium: return .yellow
        case .hard: return .orange
        case .expert: return .red
        }
    }
}