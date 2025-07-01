// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CarniCare",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "CarniCare",
            targets: ["CarniCare"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CarniCare",
            dependencies: []),
        .testTarget(
            name: "CarniCareTests",
            dependencies: ["CarniCare"]),
    ]
)