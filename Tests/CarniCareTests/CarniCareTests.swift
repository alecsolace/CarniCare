import XCTest
@testable import CarniCare

final class CarniCareTests: XCTestCase {
    
    func testPlantTypeCount() {
        XCTAssertEqual(PlantType.allCases.count, 6)
    }
    
    func testPlantTypeDisplayNames() {
        XCTAssertEqual(PlantType.venusFlytrap.displayName, "Venus Flytrap")
        XCTAssertEqual(PlantType.pitcher.displayName, "Pitcher Plant")
        XCTAssertEqual(PlantType.sundew.displayName, "Sundew")
        XCTAssertEqual(PlantType.butterwort.displayName, "Butterwort")
        XCTAssertEqual(PlantType.bladderwort.displayName, "Bladderwort")
        XCTAssertEqual(PlantType.cobra.displayName, "Cobra Plant")
    }
    
    func testCareLevelCount() {
        XCTAssertEqual(CareLevel.allCases.count, 4)
    }
    
    func testCareLevelColors() {
        XCTAssertEqual(CareLevel.beginner.color, "green")
        XCTAssertEqual(CareLevel.intermediate.color, "yellow")
        XCTAssertEqual(CareLevel.advanced.color, "orange")
        XCTAssertEqual(CareLevel.expert.color, "red")
    }
    
    func testSamplePlantsNotEmpty() {
        XCTAssertFalse(PlantData.samplePlants.isEmpty)
        XCTAssertGreaterThan(PlantData.samplePlants.count, 5)
    }
    
    func testPlantsByTypeGrouping() {
        let plantsByType = PlantData.plantsByType
        XCTAssertFalse(plantsByType.isEmpty)
        
        // Ensure we have plants for multiple types
        XCTAssertGreaterThan(plantsByType.keys.count, 1)
        
        // Ensure Venus Flytraps exist
        XCTAssertNotNil(plantsByType[.venusFlytrap])
        XCTAssertGreaterThan(plantsByType[.venusFlytrap]?.count ?? 0, 0)
    }
    
    func testPlantCreation() {
        let plant = Plant(
            name: "Test Plant",
            scientificName: "Testus plantus",
            type: .venusFlytrap,
            imageName: "test_image",
            careLevel: .beginner,
            description: "A test plant for testing purposes",
            wateringFrequency: "Daily",
            lightRequirement: "Bright light",
            humidity: "50%",
            temperature: "70°F"
        )
        
        XCTAssertEqual(plant.name, "Test Plant")
        XCTAssertEqual(plant.scientificName, "Testus plantus")
        XCTAssertEqual(plant.type, .venusFlytrap)
        XCTAssertEqual(plant.careLevel, .beginner)
    }
    
    func testPlantEquality() {
        let plant1 = Plant(
            name: "Plant 1",
            scientificName: "Plantus one",
            type: .venusFlytrap,
            imageName: "image1",
            careLevel: .beginner,
            description: "First plant",
            wateringFrequency: "Daily",
            lightRequirement: "Bright",
            humidity: "50%",
            temperature: "70°F"
        )
        
        let plant2 = Plant(
            name: "Plant 1",
            scientificName: "Plantus one",
            type: .venusFlytrap,
            imageName: "image1",
            careLevel: .beginner,
            description: "First plant",
            wateringFrequency: "Daily",
            lightRequirement: "Bright",
            humidity: "50%",
            temperature: "70°F"
        )
        
        // Plants should be hashable but have different IDs
        XCTAssertNotEqual(plant1.id, plant2.id)
    }
}