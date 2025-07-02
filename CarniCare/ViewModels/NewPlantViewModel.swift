import SwiftUI

/// ViewModel for `NewPlantView`, managing new plant creation data and actions.
final class NewPlantViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var genus: PlantGenus = .venusFlytrap
    @Published var photoData: Data?

    func savePlant() {
        // TODO: save a new Plant model to SwiftData
    }
}
