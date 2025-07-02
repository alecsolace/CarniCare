//
//  ContentView.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import SwiftUI
import SwiftData

struct PlantListView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = PlantListViewModel()
    
    @State private var isPresentingAddSheet = false

    var body: some View {
        // Update viewModel when plants change
        VStack {
            // Search bar
        }
        .onAppear {
            viewModel.loadPlants(from: modelContext)
        }
        .onChange(of: plants) { _ in
            viewModel.loadPlants(from: modelContext)
        }

        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: Constants.standardPadding) {
                ForEach(PlantGenus.allCases, id: \.self) { genus in
                    Group {
                        GenusTitleView(title: genus.rawValue)
                        if let plantList = plants.filter(\.genus == genus.description).first {
                            
                        }
                    }
                }
            }
        }
        NavigationSplitView {
            List(viewModel.filteredPlants) { item in
                NavigationLink {
                    Text(String(describing: item.genus))
                } label: {
                    Text(item.name)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { isPresentingAddSheet = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddSheet) {
                NewPlantView()
            }
        } detail: {
            Text("Select an item")
        }
    }

    private struct GenusTitleView: View {
        var title: String
        
        var body: some View {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top, Constants.titleTopPadding)
                .padding(.bottom, Constants.titleBottomPadding)
                .padding(.leading, Constants.leadingContentInset)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { viewModel.filteredPlants[$0] }.forEach { plant in
                modelContext.delete(plant)
            }
            viewModel.loadPlants() // reload data
        }
    }
}

#Preview {
    PlantListView()
        .modelContainer(for: Plant.self, inMemory: true)
}
