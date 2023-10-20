// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AwesomeSwiftExtensions",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "AwesomeSwiftExtensions",
            targets: ["AwesomeSwiftExtensions"]),
    ],
    targets: [
        .target(
            name: "AwesomeSwiftExtensions"),
        .testTarget(
            name: "AwesomeSwiftExtensionsTests",
            dependencies: ["AwesomeSwiftExtensions"]),
    ]
)
