import SwiftUI

/// ViewModel for `PlantListView`, handling fetching, filtering, and searching plants.
final class PlantListViewModel: ObservableObject {
    @Published var allPlants: [Plant] = []
    @Published var filteredPlants: [Plant] = []
    @Published var searchText: String = "" {
        didSet { filterPlants() }
    }

    init() {
        loadPlants()
    }

    /// Load plants from a SwiftData context.
    func loadPlants(from context: ModelContext) {
        let descriptor = FetchDescriptor<Plant>()
        let plants = context.fetch(descriptor)
        allPlants = plants
        filteredPlants = plants
    }

    private func loadPlants() {
        // Deprecated: use loadPlants(from:) instead
        allPlants = []
        filteredPlants = allPlants
    }

    private func filterPlants() {
        if searchText.isEmpty {
            filteredPlants = allPlants
        } else {
            filteredPlants = allPlants.filter { plant in
                plant.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
