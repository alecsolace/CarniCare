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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Plant.self,
            Flowering.self,
            Cross.self,
            Photo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
