//
//  PlantListItemView.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 15/6/25.
//

import SwiftUI

struct PlantListItemView: View {
    let plant: Plant
    
    var body: some View {
        if let data = plant.imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .overlay {
                    ReadabilityRoundedRectangle()
                }
                .clipped()
                .cornerRadius(Constants.cornerRadius)
                .overlay(alignment: .bottom) {
                    Text(plant.name)
                        .font(.title3).fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                .contextMenu {
                    ShareLink(item: plant, preview: plant.sharePreview)
                    PlantFavoriteButton(plant: plant)
                    PlantCollectionsMenu(plant: landmark)
                }
        } else {
            ZStack {
                Color.gray
                Text(plant.name)
                    .font(.title3).fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(Constants.cornerRadius)
        }
    }
}

#Preview {
    let modelData = ModelData()
    PlantListView()
}
