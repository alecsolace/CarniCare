# Copilot Context for CarniCare

## Project Overview

CarniCare is a SwiftUI application designed to help users track and care for their carnivorous plants. Key components:

- **App/**: Entry point (`CarniCareApp.swift`) and asset catalogs.
- **Model/**: Data models and related logic (`Plant.swift`, `ModelData.swift`, etc.).
- **Enum/**: Shared enumerations (e.g., `PlantGenus.swift`).
- **Views/**: SwiftUI views organized by feature (Dashboard, Plant, etc.).
- **Preview Content/**: Assets used for SwiftUI previews.
- **Tests/**: Unit tests (`CarniCareTests/`) and UI tests (`CarniCareUITests/`).

## Architecture & Conventions

- Use **Swift 5** and **SwiftUI** exclusively.
- Follow MVVM where applicable (Views bind to ObservableObjects).
- Prefer `struct` over `class` for models and views unless reference semantics are required.
- Store constants in `Model/Constants.swift`.
- Name files and types in **UpperCamelCase**, properties and methods in **lowerCamelCase**.
- Keep view logic declarative and separate styling into reusable view modifiers or subviews.
- Support multilingual localization: use localization APIs (`LocalizedStringKey` or `NSLocalizedString`) for all user-facing text and maintain `Localizable.strings` entries per locale.

## Coding Guidelines

- Write clear, concise comments for public APIs.
- Use meaningful `let` and `var` names that convey intent.
- Group extensions and protocol conformances into separate `extension` blocks.
- When adding new views, follow the existing folder structure under **Views/**.
- Ensure assets are added to the correct `.xcassets` catalog.

## Commit Message Style

- Use the imperative mood (e.g., "Add new PlantListView").
- Reference related issue numbers when available.
- Keep descriptions under 72 characters and add details in the body if necessary.

---

Place additional project-specific details here as needed. This file should help GitHub Copilot and future contributors understand project structure, naming conventions, and development standards.
