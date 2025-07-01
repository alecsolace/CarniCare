# CarniCare 🌿

A beautiful iOS SwiftUI library for displaying carnivorous plant data with a modern liquid glass aesthetic and sage green color scheme.

## Features

✨ **Modern Liquid Glass Design** - Beautiful frosted glass effects with sage green accents  
🌱 **Plant Type Grouping** - Organized by carnivorous plant types with expand/collapse functionality  
🔍 **Search & Filter** - Search plants by name, scientific name, or type  
📱 **Responsive Design** - Works beautifully on all iOS devices  
🎨 **Custom Design System** - Consistent typography, colors, and spacing  

## Plant Types Supported

- **Venus Flytrap** - Snap traps that close when triggered
- **Pitcher Plants** - Deep pitfall traps filled with digestive fluid  
- **Sundews** - Sticky tentacles that trap small insects
- **Butterworts** - Greasy leaves that trap tiny prey
- **Bladderworts** - Underwater suction traps
- **Cobra Plants** - Hooded pitcher plants with forked tongue

## Quick Start

```swift
import SwiftUI
import CarniCare

struct ContentView: View {
    var body: some View {
        CarniCare.plantListView()
    }
}
```

## Components

### PlantListView
The main view that displays all plants grouped by type with liquid glass aesthetic.

### PlantCard
Individual plant cards showing:
- Plant image (placeholder with leaf icon)
- Plant name and scientific name
- Care level badge
- Description
- Care information (watering, light, humidity, temperature)

### PlantTypeSection
Expandable sections for each plant type with:
- Type icon and description
- Plant count
- Smooth expand/collapse animations
- Liquid glass header design

## Design System

### Colors
- **Sage Green Palette** - Primary sage green with light and dark variants
- **Liquid Glass Effects** - Frosted glass backgrounds with subtle borders
- **Care Level Colors** - Green (beginner) to red (expert) progression

### Typography
- Consistent font hierarchy using iOS system fonts
- Proper contrast ratios for accessibility

### Spacing & Layout
- Responsive grid layout for plant cards
- Consistent spacing system (xs: 4pt to xxl: 48pt)
- Smooth animations and transitions

## Data Model

```swift
struct Plant {
    let name: String
    let scientificName: String
    let type: PlantType
    let careLevel: CareLevel
    let description: String
    let wateringFrequency: String
    let lightRequirement: String
    let humidity: String
    let temperature: String
}

enum PlantType: CaseIterable {
    case venusFlytrap, pitcher, sundew, butterwort, bladderwort, cobra
}

enum CareLevel: CaseIterable {
    case beginner, intermediate, advanced, expert
}
```

## Requirements

- iOS 15.0+
- macOS 12.0+
- Swift 5.9+
- SwiftUI

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/alecsolace/CarniCare.git", from: "1.0.0")
]
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.