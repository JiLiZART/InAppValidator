// swift-tools-version:3.1

import Foundation
import PackageDescription

var isTesting: Bool {
    return ProcessInfo.processInfo.environment["SWIFTPM_TEST_InAppValidator"] == "YES"
}

let package = Package(
    name: "InAppValidator",
    targets: [
        Target(
            name: "InAppValidator",
            dependencies: []),
        Target(
            name: "InAppValidatorExamples",
            dependencies: ["InAppValidator"]),
    ]
)

if isTesting {
    package.dependencies.append(contentsOf: [
        .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1),
        .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 7),
    ])
}