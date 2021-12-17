// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PetSaveOnboarding",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        .library(
            name: "PetSaveOnboarding",
            targets: ["PetSaveOnboarding"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PetSaveOnboarding", resources: [.copy("Resources/Assets.xcassets")])
    ]
)
