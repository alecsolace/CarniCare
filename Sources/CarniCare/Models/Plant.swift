import Foundation

/// Represents different types of carnivorous plants
public enum PlantType: String, CaseIterable, Identifiable {
    case venusFlytrap = "Venus Flytrap"
    case pitcher = "Pitcher Plant" 
    case sundew = "Sundew"
    case butterwort = "Butterwort"
    case bladderwort = "Bladderwort"
    case cobra = "Cobra Plant"
    
    public var id: String { self.rawValue }
    
    /// Display name for the plant type
    public var displayName: String {
        return self.rawValue
    }
    
    /// Description of the plant type
    public var description: String {
        switch self {
        case .venusFlytrap:
            return "Snap traps that close when triggered"
        case .pitcher:
            return "Deep pitfall traps filled with digestive fluid"
        case .sundew:
            return "Sticky tentacles that trap small insects"
        case .butterwort:
            return "Greasy leaves that trap tiny prey"
        case .bladderwort:
            return "Underwater suction traps"
        case .cobra:
            return "Hooded pitcher plants with forked tongue"
        }
    }
}

/// Represents a carnivorous plant
public struct Plant: Identifiable, Hashable {
    public let id = UUID()
    public let name: String
    public let scientificName: String
    public let type: PlantType
    public let imageName: String
    public let careLevel: CareLevel
    public let description: String
    public let wateringFrequency: String
    public let lightRequirement: String
    public let humidity: String
    public let temperature: String
    
    public init(
        name: String,
        scientificName: String,
        type: PlantType,
        imageName: String,
        careLevel: CareLevel,
        description: String,
        wateringFrequency: String,
        lightRequirement: String,
        humidity: String,
        temperature: String
    ) {
        self.name = name
        self.scientificName = scientificName
        self.type = type
        self.imageName = imageName
        self.careLevel = careLevel
        self.description = description
        self.wateringFrequency = wateringFrequency
        self.lightRequirement = lightRequirement
        self.humidity = humidity
        self.temperature = temperature
    }
}

/// Represents the care difficulty level
public enum CareLevel: String, CaseIterable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case expert = "Expert"
    
    /// Color associated with the care level
    public var color: String {
        switch self {
        case .beginner: return "green"
        case .intermediate: return "yellow"
        case .advanced: return "orange"
        case .expert: return "red"
        }
    }
}