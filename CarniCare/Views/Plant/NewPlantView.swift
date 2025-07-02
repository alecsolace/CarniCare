//
//  NewPlantView.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import SwiftUI

/// `NewPlantView` is a SwiftUI view that presents a form for adding a new plant to the app.
/// 
/// - The form includes fields to input the plant's name, subspecies or cultivar, and acquisition date.
/// - It uses an environment-provided `modelContext` for Core Data/model manipulation.
/// - The genus is selected from an enumerated type called `PlantGenus`, defaulting to `.sarracenia`.
/// - The view is wrapped in a `NavigationView` for navigation bar support.
/// - A section labeled "Info" groups the plant details fields.
/// - Intended for use in an app that manages carnivorous plants (CarniCare).
///
/// Usage:
/// Place `NewPlantView` within another view to allow users to add a new plant.
///
struct NewPlantView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var genus: PlantGenus = .sarracenia
    @State private var plantName: String = ""
    @State private var plantSpecies: String = ""
    @State private var acquisitionDate: Date = .distantPast
    
    var body: some View {
        NavigationView {
            Form {
                Section("Info") {
                    TextField("Name", text: $plantName)
                    TextField("Subspecies/Cultivar", text: $plantSpecies)
                    DatePicker(
                        "Acquisition Date",
                        selection: $acquisitionDate,
                        displayedComponents: .date
                    )
                }
            }
        }
    }
}

#Preview {
    NewPlantView()
        .modelContainer(for: Plant.self, inMemory: true)
}
