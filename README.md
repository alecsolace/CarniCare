# CarniCare - iOS Plant Management App

A modern SwiftUI application for managing plants with a beautiful liquid glass aesthetic.

## Features

- **Modern iOS 26 Design**: Utilizes the latest iOS design language with sage green color tones
- **Liquid Glass Aesthetic**: Frosted glass backgrounds with beautiful gradient overlays
- **Grouped Plant Management**: Plants are organized by type (Carnivorous, Succulents, Herbs, etc.)
- **Expandable Cards**: Tap on any plant type to expand and see individual plants
- **SwiftData Integration**: Persistent storage using Apple's latest data framework
- **Search Functionality**: Find plants by name, scientific name, or type
- **Plant Details**: Each plant card shows care level, sunlight requirements, and watering info

## Plant Types Supported

- 🦷 Carnivorous Plants
- 🌿 Succulents  
- 🌱 Herbs
- 🌸 Flowers
- 🍃 Ferns
- 🌳 Trees
- 🌿 Vines

## Technical Implementation

### SwiftData Models
- `Plant`: Main plant model with all plant properties
- `PlantType`: Enum for different plant categories
- `CareLevel`: Easy, Medium, Hard, Expert
- `SunlightLevel`: Low, Medium, High, Direct

### Views
- `PlantListView`: Main list view with search and grouping
- `PlantTypeSection`: Expandable section headers for each plant type
- `PlantCard`: Individual plant cards with details

### Liquid Glass Aesthetic
- Custom view modifiers for frosted glass effects
- Sage green color palette extensions
- Smooth animations and transitions

## Requirements

- iOS 17.0+
- Xcode 15.0+
- SwiftUI
- SwiftData

## Usage

1. Launch the app to see the plant list
2. Tap on any plant type header to expand/collapse that section
3. View individual plant cards with care information
4. Use the search bar to find specific plants
5. Tap the + button to add sample data

The app automatically populates with sample carnivorous plants, succulents, herbs, and more to demonstrate the interface.