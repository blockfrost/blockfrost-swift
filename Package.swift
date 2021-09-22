// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BlockfrostSwiftSDK",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v3),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "BlockfrostSwiftSDK",
            targets: ["BlockfrostSwiftSDK"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.2"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.3")),
        //.package(url: "https://github.com/yannickl/AwaitKit", .upToNextMajor(from: "5.2.0")),
        //.package(url: "https://github.com/belozierov/SwiftCoroutine", .upToNextMajor(from: "2.1.11")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "7.0.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BlockfrostSwiftSDK",
            dependencies: [ "AnyCodable", "Alamofire",
                            //"AwaitKit", "SwiftCoroutine",
            ],
            path: "BlockfrostSwiftSDK/Classes"
        ),
        .testTarget(name: "blockfrost-tests",
                    dependencies: [
                        "BlockfrostSwiftSDK",
                        "Quick",
                        "Nimble",
                    ],
                    resources: [
                        .copy("Resources"),
                    ]
                )
    ]
)
