//
//  CarniCareApp.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import SwiftUI
import SwiftData

@main
struct CarniCareApp: App {
    
    @State private var modelData = ModelData()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Plant.self,
            Flowering.self,
            Cross.self,
            Photo.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            allowsSave: true
        )
        
        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            CarniCareSplitView()
                .environment(modelData)
                .modelContainer(sharedModelContainer)
                .onGeometryChange(for: CGSize.self) { geometry in
                    geometry.size
                } action: {
                    modelData.windowSize = $0
                }
        }
    }
}
