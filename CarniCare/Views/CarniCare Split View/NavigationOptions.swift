//
//  NavigationOptions.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 10/6/25.
//

import SwiftUI

enum NavigationOptions: Equatable, Hashable, Identifiable {
    case plants
    
    case flowers
    
    static let mainPages: [NavigationOptions] = [.flowers, .plants]
    
    var id: String {
        switch self {
        case .plants: return "Plants"
        case .flowers: return "Flowers"
        }
    }
    
    var name: LocalizedStringResource {
        switch self {
        case .plants: LocalizedStringResource("Plants", comment: "Title for the plants tab, shown in the sidebar.")
        case.flowers: LocalizedStringResource("Flowers", comment: "Title for the flowers tab, shown in the sidebar.")
        }
    }
    
    var symbolName: String {
        switch self {
        case .plants: ""
        case .flowers: ""
        }
    }
    
    
    @MainActor @ViewBuilder func viewForPage() -> some View {
        switch self {
        case .flowers: PlantListView()
        case .plants: PlantListView()
        }
    }
}
