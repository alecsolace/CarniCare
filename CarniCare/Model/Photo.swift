//
//  Photo.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import Foundation
import SwiftData

@Model
class Photo {
    @Attribute(.unique) var id: UUID
    var imageData: Data
    var dateAdded: Date

    @Relationship(inverse: \Flowering.photos)
    var flowering: Flowering?

    @Relationship(inverse: \Cross.photos)
    var cross: Cross?
    
    init(
        id: UUID,
        imageData: Data,
        dateAdded: Date,
        flowering: Flowering? = nil,
        cross: Cross? = nil
    ) {
        self.id = .init()
        self.imageData = imageData
        self.dateAdded = .now
        self.flowering = flowering
        self.cross = cross
    }
}
