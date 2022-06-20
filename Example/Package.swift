// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Example",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v3),
    ],
    dependencies: [
        // Use either local package name or github-published
        .package(name:"BlockfrostSwiftSDK", path: "../"),

        // Requires .product in target.executableTarget.dependencies
        //.package(url: "https://github.com/blockfrost/blockfrost-swift.git", from: "1.0.1"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "Example",
            dependencies: [
                // Used when BlockfrostSwiftSDK is local dep.
                "BlockfrostSwiftSDK",

                // uncomment if using github
                //.product(name: "BlockfrostSwiftSDK", package: "blockfrost-swift"),
            ]),
       
    ]
)
