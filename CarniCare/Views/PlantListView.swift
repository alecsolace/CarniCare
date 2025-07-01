import SwiftUI
import SwiftData

struct PlantListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var plants: [Plant]
    @State private var expandedSections: Set<PlantType> = []
    @State private var searchText = ""
    
    private var groupedPlants: [PlantType: [Plant]] {
        Dictionary(grouping: filteredPlants, by: { $0.plantType })
    }
    
    private var filteredPlants: [Plant] {
        if searchText.isEmpty {
            return plants
        } else {
            return plants.filter { plant in
                plant.name.localizedCaseInsensitiveContains(searchText) ||
                plant.scientificName.localizedCaseInsensitiveContains(searchText) ||
                plant.plantType.displayName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color.sageGreenLight.opacity(0.1),
                        Color.sageGreen.opacity(0.05),
                        Color.sageGreenDark.opacity(0.1)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(PlantType.allCases, id: \.self) { plantType in
                            if let plantsInType = groupedPlants[plantType], !plantsInType.isEmpty {
                                PlantTypeSection(
                                    plantType: plantType,
                                    plants: plantsInType,
                                    isExpanded: expandedSections.contains(plantType)
                                ) {
                                    toggleExpansion(for: plantType)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                .searchable(text: $searchText, prompt: "Search plants...")
            }
            .navigationTitle("My Plants")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addSampleData) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.sageGreen)
                    }
                }
            }
        }
        .onAppear {
            if plants.isEmpty {
                addSampleData()
            }
        }
    }
    
    private func toggleExpansion(for plantType: PlantType) {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            if expandedSections.contains(plantType) {
                expandedSections.remove(plantType)
            } else {
                expandedSections.insert(plantType)
            }
        }
    }
    
    private func addSampleData() {
        let samplePlants = [
            Plant(name: "Venus Flytrap", scientificName: "Dionaea muscipula", plantType: .carnivorous, imageName: "mouth.fill", careLevel: .hard, wateringFrequency: "Keep soil moist", sunlightRequirement: .high, notes: "Fascinating carnivorous plant that catches insects"),
            Plant(name: "Pitcher Plant", scientificName: "Nepenthes alata", plantType: .carnivorous, imageName: "mouth.fill", careLevel: .expert, wateringFrequency: "High humidity", sunlightRequirement: .medium, notes: "Tropical carnivorous vine"),
            Plant(name: "Echeveria", scientificName: "Echeveria elegans", plantType: .succulent, imageName: "leaf.fill", careLevel: .easy, wateringFrequency: "Every 2 weeks", sunlightRequirement: .high, notes: "Beautiful rosette succulent"),
            Plant(name: "Jade Plant", scientificName: "Crassula ovata", plantType: .succulent, imageName: "leaf.fill", careLevel: .easy, wateringFrequency: "Monthly", sunlightRequirement: .medium, notes: "Lucky money tree"),
            Plant(name: "Basil", scientificName: "Ocimum basilicum", plantType: .herb, imageName: "leaf.arrow.circlepath", careLevel: .medium, wateringFrequency: "Every 3 days", sunlightRequirement: .high, notes: "Perfect for cooking"),
            Plant(name: "Rosemary", scientificName: "Rosmarinus officinalis", plantType: .herb, imageName: "leaf.arrow.circlepath", careLevel: .medium, wateringFrequency: "Weekly", sunlightRequirement: .high, notes: "Aromatic Mediterranean herb"),
            Plant(name: "Peace Lily", scientificName: "Spathiphyllum wallisii", plantType: .flower, imageName: "flourish", careLevel: .easy, wateringFrequency: "Weekly", sunlightRequirement: .low, notes: "Air purifying plant"),
            Plant(name: "Boston Fern", scientificName: "Nephrolepis exaltata", plantType: .fern, imageName: "leaf", careLevel: .medium, wateringFrequency: "Keep moist", sunlightRequirement: .low, notes: "Classic houseplant fern")
        ]
        
        for plant in samplePlants {
            modelContext.insert(plant)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save sample data: \(error)")
        }
    }
}