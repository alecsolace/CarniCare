import SwiftUI

/// ViewModel for `DashboardView`, managing upcoming tasks and summary data.
final class DashboardViewModel: ObservableObject {
    @Published var upcomingTasks: [String] = []
    private var context: ModelContext?

    init() { }

    /// Fetch upcoming tasks (e.g., watering reminders) from SwiftData.
    func fetchUpcomingTasks(from context: ModelContext) {
        self.context = context
        let descriptor = FetchDescriptor<Plant>()
        let plants = context.fetch(descriptor)
        // Example task: prompt user to water each plant
        upcomingTasks = plants.map { "Water \($0.name)" }
    }
}
