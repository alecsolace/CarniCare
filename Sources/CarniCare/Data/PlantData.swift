import Foundation

/// Sample data for carnivorous plants
public struct PlantData {
    public static let samplePlants: [Plant] = [
        // Venus Flytraps
        Plant(
            name: "Classic Venus Flytrap",
            scientificName: "Dionaea muscipula",
            type: .venusFlytrap,
            imageName: "venus_flytrap_classic",
            careLevel: .beginner,
            description: "The iconic carnivorous plant with snap traps that close when triggered by prey.",
            wateringFrequency: "Keep soil moist with distilled water",
            lightRequirement: "Bright indirect light, 4-6 hours",
            humidity: "50-60%",
            temperature: "65-75°F (18-24°C)"
        ),
        Plant(
            name: "Red Dragon Venus Flytrap",
            scientificName: "Dionaea muscipula 'Red Dragon'",
            type: .venusFlytrap,
            imageName: "venus_flytrap_red_dragon",
            careLevel: .intermediate,
            description: "A striking cultivar with deep red coloration throughout the plant.",
            wateringFrequency: "Keep soil moist with distilled water",
            lightRequirement: "Bright direct light, 6+ hours",
            humidity: "50-70%",
            temperature: "65-80°F (18-27°C)"
        ),
        
        // Pitcher Plants
        Plant(
            name: "Purple Pitcher Plant",
            scientificName: "Sarracenia purpurea",
            type: .pitcher,
            imageName: "pitcher_purple",
            careLevel: .beginner,
            description: "Hardy North American pitcher plant with distinctive purple veining.",
            wateringFrequency: "Keep in standing water tray",
            lightRequirement: "Full sun to partial shade",
            humidity: "60-80%",
            temperature: "50-85°F (10-29°C)"
        ),
        Plant(
            name: "Trumpet Pitcher",
            scientificName: "Sarracenia flava",
            type: .pitcher,
            imageName: "pitcher_trumpet",
            careLevel: .intermediate,
            description: "Tall, yellow-green pitchers with distinctive red throat markings.",
            wateringFrequency: "Keep in standing water tray",
            lightRequirement: "Full sun, 6+ hours",
            humidity: "60-80%",
            temperature: "60-85°F (15-29°C)"
        ),
        Plant(
            name: "Nepenthes Ventrata",
            scientificName: "Nepenthes × ventrata",
            type: .pitcher,
            imageName: "nepenthes_ventrata",
            careLevel: .intermediate,
            description: "Popular tropical pitcher plant hybrid, great for beginners to Nepenthes.",
            wateringFrequency: "Keep soil moist, not waterlogged",
            lightRequirement: "Bright indirect light",
            humidity: "70-90%",
            temperature: "70-85°F (21-29°C)"
        ),
        
        // Sundews
        Plant(
            name: "Cape Sundew",
            scientificName: "Drosera capensis",
            type: .sundew,
            imageName: "sundew_cape",
            careLevel: .beginner,
            description: "Easy-to-grow sundew with long, narrow leaves covered in sticky tentacles.",
            wateringFrequency: "Keep in shallow water tray",
            lightRequirement: "Bright light, 4-6 hours",
            humidity: "50-70%",
            temperature: "65-80°F (18-27°C)"
        ),
        Plant(
            name: "Forked Sundew",
            scientificName: "Drosera binata",
            type: .sundew,
            imageName: "sundew_forked",
            careLevel: .intermediate,
            description: "Unique sundew with forked, branching leaves that form Y-shapes.",
            wateringFrequency: "Keep in shallow water tray",
            lightRequirement: "Bright light, 5-7 hours",
            humidity: "60-80%",
            temperature: "60-75°F (15-24°C)"
        ),
        
        // Butterworts
        Plant(
            name: "Common Butterwort",
            scientificName: "Pinguicula vulgaris",
            type: .butterwort,
            imageName: "butterwort_common",
            careLevel: .intermediate,
            description: "Small rosette plant with greasy leaves that trap tiny insects.",
            wateringFrequency: "Keep soil slightly moist",
            lightRequirement: "Bright indirect light",
            humidity: "60-80%",
            temperature: "50-70°F (10-21°C)"
        ),
        Plant(
            name: "Mexican Butterwort",
            scientificName: "Pinguicula moranensis",
            type: .butterwort,
            imageName: "butterwort_mexican",
            careLevel: .advanced,
            description: "Beautiful butterwort with purple flowers and seasonal growth changes.",
            wateringFrequency: "Seasonal watering changes",
            lightRequirement: "Bright indirect light",
            humidity: "50-70%",
            temperature: "60-75°F (15-24°C)"
        ),
        
        // Bladderworts
        Plant(
            name: "Greater Bladderwort",
            scientificName: "Utricularia vulgaris",
            type: .bladderwort,
            imageName: "bladderwort_greater",
            careLevel: .expert,
            description: "Aquatic carnivorous plant with tiny suction traps for microscopic prey.",
            wateringFrequency: "Aquatic - keep submerged",
            lightRequirement: "Bright light, aquarium setup",
            humidity: "100% (aquatic)",
            temperature: "65-75°F (18-24°C)"
        ),
        
        // Cobra Plants
        Plant(
            name: "California Cobra Plant",
            scientificName: "Darlingtonia californica",
            type: .cobra,
            imageName: "cobra_california",
            careLevel: .expert,
            description: "Rare hooded pitcher plant with distinctive cobra-like appearance.",
            wateringFrequency: "Keep roots cool and moist",
            lightRequirement: "Bright indirect light",
            humidity: "70-90%",
            temperature: "50-70°F (10-21°C)"
        )
    ]
    
    /// Groups plants by their type
    public static var plantsByType: [PlantType: [Plant]] {
        Dictionary(grouping: samplePlants, by: { $0.type })
    }
}