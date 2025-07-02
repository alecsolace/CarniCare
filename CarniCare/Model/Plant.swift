//
//  Plant.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import Foundation
import SwiftData
import FoundationModels
import SwiftUI


@Model
class Plant : Transferable {
    typealias Representation = <#type#>

    @Attribute(.unique) var id: Int
    var name: String
    var genus: PlantGenus
    var cultivar: String?
    var acquisitionDate: Date
    @Attribute(.externalStorage) var imageData: Data?
    
    var flowerings: [Flowering] = []
    var crossesAsReceptor: [Cross] = []
    var crossesAsDonor: [Cross] = []
    
    var sharePreview: SharePreview<Never, Image> {
        let icon: Image
        if let imageData, let uiImage = UIImage(data: imageData) {
            icon = Image(uiImage: uiImage)
        } else {
            icon = Image(systemName: "photo") // fallback icon
        }
        return SharePreview(name, icon: icon)
    }
    
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
