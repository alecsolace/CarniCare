//
//  DashboardView.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 9/5/25.
//

import SwiftUI

struct DashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        TabView {
            // My plants tab: show upcoming tasks and plant list
            Tab("My plants", systemImage: "leaf") {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Upcoming Tasks")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, Constants.standardPadding)
                        .padding(.top, Constants.standardPadding)
                    List(viewModel.upcomingTasks, id: ".self") { task in
                        Text(task)
                    }
                    .listStyle(.plain)
                    .frame(maxHeight: 200)
                    PlantListView()
                        .modelContext(modelContext)
                }
                .onAppear {
                    viewModel.fetchUpcomingTasks(from: modelContext)
                }
            }
            Tab("Genealogy", systemImage: "fossil.shell"){}
            Tab("Flowers", systemImage: "camera.macro"){}
            Tab(role: .search) {}
            
        }
        .glassEffect()
    }

    #Preview {
        DashboardView()
    }
}
