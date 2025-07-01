import XCTest
@testable import CarniCare

final class CarniCareTests: XCTestCase {
    
    func testPlantCreation() throws {
        let plant = Plant(
            name: "Venus Flytrap",
            scientificName: "Dionaea muscipula",
            plantType: .carnivorous,
            careLevel: .hard,
            wateringFrequency: "Keep soil moist",
            sunlightRequirement: .high
        )
        
        XCTAssertEqual(plant.name, "Venus Flytrap")
        XCTAssertEqual(plant.scientificName, "Dionaea muscipula")
        XCTAssertEqual(plant.plantType, .carnivorous)
        XCTAssertEqual(plant.careLevel, .hard)
        XCTAssertEqual(plant.wateringFrequency, "Keep soil moist")
        XCTAssertEqual(plant.sunlightRequirement, .high)
        XCTAssertTrue(plant.isActive)
        XCTAssertNotNil(plant.id)
    }
    
    func testPlantTypes() throws {
        XCTAssertEqual(PlantType.carnivorous.displayName, "Carnivorous")
        XCTAssertEqual(PlantType.succulent.displayName, "Succulents")
        XCTAssertEqual(PlantType.herb.displayName, "Herbs")
        XCTAssertEqual(PlantType.flower.displayName, "Flowers")
        XCTAssertEqual(PlantType.fern.displayName, "Ferns")
        XCTAssertEqual(PlantType.tree.displayName, "Trees")
        XCTAssertEqual(PlantType.vine.displayName, "Vines")
        
        XCTAssertEqual(PlantType.carnivorous.iconName, "mouth.fill")
        XCTAssertEqual(PlantType.succulent.iconName, "leaf.fill")
        XCTAssertEqual(PlantType.herb.iconName, "leaf.arrow.circlepath")
    }
    
    func testCareLevels() throws {
        XCTAssertEqual(CareLevel.easy.color, "green")
        XCTAssertEqual(CareLevel.medium.color, "yellow")
        XCTAssertEqual(CareLevel.hard.color, "orange")
        XCTAssertEqual(CareLevel.expert.color, "red")
    }
    
    func testSunlightLevels() throws {
        let levels = SunlightLevel.allCases
        XCTAssertEqual(levels.count, 4)
        XCTAssertTrue(levels.contains(.low))
        XCTAssertTrue(levels.contains(.medium))
        XCTAssertTrue(levels.contains(.high))
        XCTAssertTrue(levels.contains(.direct))
    }
}