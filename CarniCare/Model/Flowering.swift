//
//  Flowering.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import Foundation
import SwiftData

@Model
class Flowering {
    @Attribute(.unique) var id: UUID
    var date: Date
    var flowerCount: Int
    var notes: String?

    @Relationship(inverse: \Plant.flowerings)
    var plant: Plant
    var crosses: [Cross] = []
    var photos: [Photo] = []
    
    init(
        id: UUID,
        date: Date,
        flowerCount: Int,
        notes: String? = nil,
        plant: Plant
    ) {
        self.id = .init()
        self.date = date
        self.flowerCount = flowerCount
        self.notes = notes
        self.plant = plant
    }
}
