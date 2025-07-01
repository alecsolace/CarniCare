import SwiftUI

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
            .modelContainer(for: Plant.self, inMemory: true)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 15 Pro")
            .previewDisplayName("iPhone 15 Pro - Light")
        
        PlantListView()
            .modelContainer(for: Plant.self, inMemory: true)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 15 Pro")
            .previewDisplayName("iPhone 15 Pro - Dark")
        
        PlantListView()
            .modelContainer(for: Plant.self, inMemory: true)
            .preferredColorScheme(.light)
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewDisplayName("iPad Pro - Light")
    }
}

struct PlantTypeSection_Previews: PreviewProvider {
    static var previews: some View {
        let samplePlants = [
            Plant(name: "Venus Flytrap", scientificName: "Dionaea muscipula", plantType: .carnivorous, careLevel: .hard),
            Plant(name: "Pitcher Plant", scientificName: "Nepenthes alata", plantType: .carnivorous, careLevel: .expert)
        ]
        
        VStack {
            PlantTypeSection(
                plantType: .carnivorous,
                plants: samplePlants,
                isExpanded: true
            ) {}
            
            PlantTypeSection(
                plantType: .succulent,
                plants: [],
                isExpanded: false
            ) {}
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color.sageGreenLight.opacity(0.1), Color.sageGreen.opacity(0.05)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .previewLayout(.sizeThatFits)
    }
}