# CarniCare

A SwiftUI app following MVVM architecture patterns.

## Project Structure

The project follows MVVM (Model-View-ViewModel) architecture for better code organization and maintainability:

```
CarniCare/
├── Models/          # Data models (SwiftData entities)
│   └── Item.swift
├── Views/           # SwiftUI views (UI components)
│   └── ContentView.swift  
├── ViewModels/      # Business logic and state management
│   └── ContentViewModel.swift
├── Assets.xcassets/ # App assets and resources
└── Preview Content/ # SwiftUI preview assets
```

## Code Style

This project uses SwiftLint for consistent code style and quality. The configuration is defined in `.swiftlint.yml`.

## Architecture Guidelines

- **Models**: Place all data models, Core Data/SwiftData entities in the `Models/` folder
- **Views**: Place all SwiftUI views and UI components in the `Views/` folder  
- **ViewModels**: Place all business logic, state management, and data processing in the `ViewModels/` folder
- Keep views lightweight and focused on UI presentation
- Business logic should be handled in ViewModels
- Maintain clear separation of concerns

## Getting Started

1. Open `CarniCare.xcodeproj` in Xcode
2. Build and run the project
3. Follow the established folder structure when adding new files