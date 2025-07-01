#if canImport(SwiftUI)
import SwiftUI

/// Main view displaying the list of plants grouped by type with liquid glass aesthetic
public struct PlantListView: View {
    @State private var searchText = ""
    @State private var selectedPlantType: PlantType?
    
    private var plantsByType: [PlantType: [Plant]] {
        let filteredPlants = searchText.isEmpty ? 
            PlantData.samplePlants : 
            PlantData.samplePlants.filter { plant in
                plant.name.localizedCaseInsensitiveContains(searchText) ||
                plant.scientificName.localizedCaseInsensitiveContains(searchText) ||
                plant.type.displayName.localizedCaseInsensitiveContains(searchText)
            }
        
        return Dictionary(grouping: filteredPlants, by: { $0.type })
    }
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        DesignSystem.Colors.lightSage.opacity(0.3),
                        DesignSystem.Colors.sageGreen.opacity(0.1),
                        Color.white.opacity(0.8)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: DesignSystem.Spacing.lg) {
                        // Header section
                        headerSection
                        
                        // Search bar
                        searchBar
                        
                        // Plant type filter chips
                        if !searchText.isEmpty {
                            filterChips
                        }
                        
                        // Plant sections grouped by type
                        LazyVStack(spacing: DesignSystem.Spacing.lg) {
                            ForEach(sortedPlantTypes, id: \.self) { plantType in
                                if let plants = plantsByType[plantType], !plants.isEmpty {
                                    PlantTypeSection(plantType: plantType, plants: plants)
                                }
                            }
                        }
                        .padding(.horizontal, DesignSystem.Spacing.md)
                        
                        // Footer spacer
                        Spacer(minLength: DesignSystem.Spacing.xl)
                    }
                    .padding(.top, DesignSystem.Spacing.sm)
                }
                .refreshable {
                    // Simulate refresh action
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                }
            }
            .navigationTitle("CarniCare")
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $searchText, prompt: "Search plants...")
    }
    
    private var headerSection: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            Text("Carnivorous Plants")
                .font(DesignSystem.Typography.title)
                .foregroundColor(DesignSystem.Colors.darkSage)
                .multilineTextAlignment(.center)
            
            Text("Discover the fascinating world of carnivorous plants")
                .font(DesignSystem.Typography.subheadline)
                .foregroundColor(DesignSystem.Colors.secondaryText)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, DesignSystem.Spacing.lg)
        .padding(.top, DesignSystem.Spacing.md)
    }
    
    private var searchBar: some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(DesignSystem.Colors.accentSage)
            
            TextField("Search plants, types, or scientific names...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(DesignSystem.Colors.secondaryText)
                }
            }
        }
        .padding(DesignSystem.Spacing.md)
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
        .padding(.horizontal, DesignSystem.Spacing.md)
    }
    
    private var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignSystem.Spacing.sm) {
                ForEach(PlantType.allCases) { plantType in
                    if plantsByType[plantType]?.isEmpty == false {
                        filterChip(for: plantType)
                    }
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.md)
        }
    }
    
    private func filterChip(for plantType: PlantType) -> some View {
        Button(action: {
            selectedPlantType = selectedPlantType == plantType ? nil : plantType
        }) {
            HStack(spacing: DesignSystem.Spacing.xs) {
                Image(systemName: plantTypeIcon(for: plantType))
                    .font(.caption)
                
                Text(plantType.displayName)
                    .font(DesignSystem.Typography.caption)
                    .fontWeight(.medium)
                
                if let count = plantsByType[plantType]?.count {
                    Text("(\(count))")
                        .font(DesignSystem.Typography.caption)
                        .foregroundColor(DesignSystem.Colors.secondaryText)
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.sm)
            .padding(.vertical, DesignSystem.Spacing.xs)
            .background(
                Capsule()
                    .fill(selectedPlantType == plantType ? 
                          DesignSystem.Colors.sageGreen.opacity(0.3) : 
                          DesignSystem.Colors.glassBackground)
                    .overlay(
                        Capsule()
                            .stroke(
                                selectedPlantType == plantType ? 
                                DesignSystem.Colors.sageGreen : 
                                DesignSystem.Colors.glassBorder, 
                                lineWidth: 1
                            )
                    )
            )
            .foregroundColor(
                selectedPlantType == plantType ? 
                DesignSystem.Colors.darkSage : 
                DesignSystem.Colors.primaryText
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func plantTypeIcon(for plantType: PlantType) -> String {
        switch plantType {
        case .venusFlytrap: return "scissors"
        case .pitcher: return "cup.and.saucer.fill"
        case .sundew: return "drop.circle.fill"
        case .butterwort: return "leaf.circle.fill"
        case .bladderwort: return "bubbles.and.sparkles.fill"
        case .cobra: return "tornado"
        }
    }
    
    private var sortedPlantTypes: [PlantType] {
        PlantType.allCases.sorted { type1, type2 in
            let count1 = plantsByType[type1]?.count ?? 0
            let count2 = plantsByType[type2]?.count ?? 0
            return count1 > count2
        }
    }
}

#if DEBUG
struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
#endif
#endif