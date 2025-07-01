import Foundation
import SwiftData

@Model
final class Plant {
    var id: UUID
    var name: String
    var scientificName: String
    var plantType: PlantType
    var imageName: String
    var careLevel: CareLevel
    var wateringFrequency: String
    var sunlightRequirement: SunlightLevel
    var notes: String
    var dateAdded: Date
    var isActive: Bool
    
    init(
        name: String,
        scientificName: String,
        plantType: PlantType,
        imageName: String = "leaf.fill",
        careLevel: CareLevel = .medium,
        wateringFrequency: String = "Weekly",
        sunlightRequirement: SunlightLevel = .medium,
        notes: String = ""
    ) {
        self.id = UUID()
        self.name = name
        self.scientificName = scientificName
        self.plantType = plantType
        self.imageName = imageName
        self.careLevel = careLevel
        self.wateringFrequency = wateringFrequency
        self.sunlightRequirement = sunlightRequirement
        self.notes = notes
        self.dateAdded = Date()
        self.isActive = true
    }
}

enum PlantType: String, CaseIterable, Codable {
    case carnivorous = "Carnivorous"
    case succulent = "Succulents"
    case herb = "Herbs"
    case flower = "Flowers"
    case fern = "Ferns"
    case tree = "Trees"
    case vine = "Vines"
    
    var displayName: String {
        return self.rawValue
    }
    
    var iconName: String {
        switch self {
        case .carnivorous: return "mouth.fill"
        case .succulent: return "leaf.fill"
        case .herb: return "leaf.arrow.circlepath"
        case .flower: return "flourish"
        case .fern: return "leaf"
        case .tree: return "tree.fill"
        case .vine: return "leaf.circle.fill"
        }
    }
}

enum CareLevel: String, CaseIterable, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case expert = "Expert"
    
    var color: String {
        switch self {
        case .easy: return "green"
        case .medium: return "yellow"
        case .hard: return "orange"
        case .expert: return "red"
        }
    }
}

enum SunlightLevel: String, CaseIterable, Codable {
    case low = "Low Light"
    case medium = "Medium Light"
    case high = "Bright Light"
    case direct = "Direct Sun"
}