# AweseomeSwiftExtensions

[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#swift-package-manager)
![Swift version](https://img.shields.io/badge/swift-5.6-orange.svg)

#### A collection of useful Swift extensions
###### This collection contains many small but handy extension that is useful in almost any iOS project.  

# Version 1.0.0


# Features

## Array Extension: Chunked

A Swift extension for the `Array` type that provides a method to break up the array into chunks of a specified size.

## Usage

This extension adds a `chunked(into:)` method to the `Array` type.

### Parameters:
- **size**: The size of each chunked array.

### Returns:
An array of arrays where each sub-array (or "chunk") contains up to the specified number of elements.

### Example:

```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let chunkedNumbers = numbers.chunked(into: 3)
print(chunkedNumbers) // Output: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

## Installation

### Requirements
**Swift** version **>= 5.6**<br />
**iOS** version **>= 13.0**<br />

### Swift Package Manager

Just add to your `Package.swift` under dependencies:
```swift
let package = Package(
    name: "MyPackage",
    products: [...],
    dependencies: [
        .package(url: "https://github.com/zeiteisen/AwesomeSwiftExtensions.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [...]
)
```

## Contributing

If you have comments, complaints or ideas for improvements, feel free to open an issue or a pull request.

AwesomeSwiftExtensions is available under the MIT license. See the LICENSE file for more info.
