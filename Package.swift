// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Mayon",
    targets: [
        Target(name: "MayonFramework"),
        Target(name: "mayon",
               dependencies: [
                .Target(name: "MayonFramework")
               ])
    ],
    dependencies: [
        .Package(url: "https://github.com/jakeheis/SwiftCLI", majorVersion: 3, minor: 0)
    ]
)
