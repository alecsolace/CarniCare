//
//  Cross.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import Foundation
import SwiftData

@Model
class Cross {
    @Attribute(.unique) var id: UUID
    var date: Date
    var openPollination: Bool = false
    var notes: String?

    @Relationship(inverse: \Plant.crossesAsReceptor)
    var receptor: Plant

    @Relationship(inverse: \Plant.crossesAsDonor)
    var donor: Plant?

    @Relationship(inverse: \Flowering.crosses)
    var sourceFlowering: Flowering

    var photos: [Photo] = []
    
    init(
        id: UUID,
        date: Date,
        openPollination: Bool,
        notes: String? = nil,
        receptor: Plant,
        donor: Plant? = nil,
        sourceFlowering: Flowering,
        photos: [Photo]
    ) {
        self.id = .init()
        self.date = date
        self.openPollination = openPollination
        self.notes = notes
        self.receptor = receptor
        self.donor = donor
        self.sourceFlowering = sourceFlowering
        self.photos = photos
    }
}
