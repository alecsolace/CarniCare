//
//  CarniCareSplitView.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 10/6/25.
//

import SwiftUI

struct CarniCareSplitView: View {
    @Bindable @Environment(ModelData.self) var modelData
    @Environment(\.modelContext) private var modelContext

    @State private var preferredColumn: NavigationSplitViewColumn = .detail
    
    var body: some View {
        TabView {
            ForEach(NavigationOptions.mainPages) { page in
                NavigationStack(path: $modelData.path) {
                    page.viewForPage()
                }
                .navigationDestination(for: Plant.self) { plant in
                    PlantListView()
                        .modelContext(modelContext)
                }
                .navigationDestination(for: Flowering.self) { flower in
                    PlantListView()
                }
                .tabItem {
                    Label(page.name.key, systemImage: page.symbolName)
                }
            }
        }
        .searchable(text: $modelData.searchString, prompt: "Search")
    }
}

#Preview {
    @Previewable @State var modelData = ModelData()
    
    
    CarniCareSplitView()
        .environment(modelData)
}
