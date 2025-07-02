//
//  LandmarkFavoriteButton.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 15/6/25.
//


import SwiftUI

/// A button for adding or removing a landmark from the list of favorite landmarks.
struct PlantFavoriteButton: View {
    @Environment(ModelData.self) private var modelData
    let plant: Plant

    var body: some View {
        Button {
            modelData.toggleFavorite(plant)
        } label: {
            FavoriteButtonLabel(isFavorite: modelData.isFavorite(plant))
        }
    }
}

private struct FavoriteButtonLabel: View {
    var isFavorite: Bool
    var body: some View {
        Label(isFavorite ? "Unfavorite" : "Favorite", systemImage: "heart")
            .symbolVariant(isFavorite ? .fill : .none)
    }
}

#Preview {
    @Previewable @State var modelData = ModelData()
    
    let plant = Plant(
        name: "Test Plant",
        genus: .sarracenia,
        acquisitionDate: Date()
    )

    PlantFavoriteButton(plant: plant)
        .environment(modelData)
}
