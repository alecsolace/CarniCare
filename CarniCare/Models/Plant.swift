//
//  Plant.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import Foundation
import SwiftData

@Model
class Plant {
    @Attribute(.unique) var id: UUID
    var name: String
    var genus: PlantGenus
    var cultivar: String?
    var acquisitionDate: Date
    
    var flowerings: [Flowering] = []
    var crossesAsReceptor: [Cross] = []
    var crossesAsDonor: [Cross] = []
    
    init(
        name: String,
        genus: PlantGenus,
        cultivar: String? = nil,
        acquisitionDate: Date
    ) {
        self.id = .init()
        self.name = name
        self.genus = genus
        self.cultivar = cultivar
        self.acquisitionDate = acquisitionDate
    }
}
