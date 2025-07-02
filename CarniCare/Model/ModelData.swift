//
//  ModelData.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 10/6/25.
//

import Foundation
import SwiftUI

@Observable @MainActor
class ModelData {
    var plants: [Plant] = []
    var selectedPlant: Plant? = nil
    var isPlantInspectorPresented: Bool = false
    var favoritePlants: [Plant] = []
    
    
    var searchString: String = ""
    var path: NavigationPath = NavigationPath() {
        didSet {
            // Check if the person navigates away from a view that's showing the inspector.
            if path.count < oldValue.count && isPlantInspectorPresented == true {
                // Dismiss the inspector.
                isPlantInspectorPresented = false
            }
        }
    }
    
    var windowSize: CGSize = .zero
    
    func isFavorite(_ plant: Plant) -> Bool {
        var isFavorite: Bool = false
        
        if favoritePlants.firstIndex(of: plant) != nil {
            isFavorite = true
        }
        
        return isFavorite
    }

    func toggleFavorite(_ plant: Plant) {
        if isFavorite(plant) {
            removeFavorite(plant)
        } else {
            addFavorite(plant)
        }
    }

    func addFavorite(_ plant: Plant) {
        favoritePlants.append(plant)
    }

    func removeFavorite(_ plant: Plant) {
        if let plantIndex = favoritePlants.firstIndex(of: plant) {
            favoritePlants.remove(at: plantIndex)
        }
    }
    
    init() {
        print("Model data initialized")
    }
}
