// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Mayon",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6)
    ]
)
