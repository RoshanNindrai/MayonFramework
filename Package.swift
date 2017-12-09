// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mayon",
    products: [
        .library(name: "MayonFramework", targets: ["MayonFramework"]),
        .executable(name: "Mayon", targets: ["Mayon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", .exact("4.0.0"))
    ],
    targets: [
        .target(name: "Mayon", dependencies: ["MayonFramework", "SwiftCLI"]),
        .target(name: "MayonFramework", dependencies: []),
        .testTarget(name: "MayonFrameworkTests", dependencies: ["MayonFramework"]),
    ]
)
