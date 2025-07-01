import Foundation

/// CarniCare - A beautiful iOS library for displaying carnivorous plant data
/// with liquid glass aesthetic and modern design.

#if canImport(SwiftUI)
import SwiftUI

// Re-export all public components
public typealias CarniCarePlantListView = PlantListView
public typealias CarniCarePlantCard = PlantCard
public typealias CarniCarePlantTypeSection = PlantTypeSection

// MARK: - Quick Start
/// Main entry point for the CarniCare plant list view
public struct CarniCare {
    /// Creates the main plant list view
    @available(iOS 15.0, macOS 12.0, *)
    public static func plantListView() -> some View {
        PlantListView()
    }
    
    /// Sample plant data for testing and development
    public static var samplePlants: [Plant] {
        PlantData.samplePlants
    }
    
    /// Plants grouped by type
    public static var plantsByType: [PlantType: [Plant]] {
        PlantData.plantsByType
    }
}
#else
// Non-SwiftUI platforms - provide basic data access only
public struct CarniCare {
    /// Sample plant data for testing and development
    public static var samplePlants: [Plant] {
        PlantData.samplePlants
    }
    
    /// Plants grouped by type
    public static var plantsByType: [PlantType: [Plant]] {
        PlantData.plantsByType
    }
}
#endif