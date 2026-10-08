// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Utilities
public enum UpcomingFeatures: String, CaseIterable {
    case existentialAny
    case internalImportsByDefault
    case memberImportVisibility
    case nonescapableTypes
    case nonisolatedNonsendingByDefault
    case inferIsolatedConformances
    case valueGenerics
    case immutableWeakCaptures

    var asSetting: SwiftSetting { .enableUpcomingFeature(rawValue.prefix(1).uppercased() + rawValue.dropFirst()) }
}

public enum ExperimentalFeatures: String, CaseIterable {
    case fullTypedThrows
    case keyPathWithMethodMembers

    var asSetting: SwiftSetting { .enableUpcomingFeature(rawValue.prefix(1).uppercased() + rawValue.dropFirst()) }
}

public extension Array where Element == SwiftSetting {
    static var allFeatures: Self { .experimentalFeatures + .upcomingFeatures }
    static var experimentalFeatures: Self { ExperimentalFeatures.allCases.map(\.asSetting) }
    static var upcomingFeatures: Self { UpcomingFeatures.allCases.map(\.asSetting) }
}

func platformDeps(_ platforms: SupportedPlatform...) -> [SupportedPlatform] {
    platforms
}

func targetDep(name: String, package: String, condition: TargetDependencyCondition? = nil) -> Target.Dependency {
    .product(name: name, package: package, condition: condition)
}

// MARK: - Traits
var traits: Set<Trait> = []

traits.insert(
    .default(enabledTraits: Set(traits.map(\.name)))
)

// MARK: - Dependencies
let casePaths = targetDep(name: "CasePaths", package: "swift-case-paths")
let communication = targetDep(name: "Communication", package: "swift-communication")
let urlRouting = targetDep(name: "URLRouting", package: "swift-url-routing")

let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/martoniojunior/swift-communication", branch: "main"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", .upToNextMajor(from: "1.7.0")),
    .package(url: "https://github.com/pointfreeco/swift-url-routing", .upToNextMajor(from: "0.6.2"))
]

// MARK: - Targets
let targets: [Target] = [
    .target(
        name: "Common",
        dependencies: [communication, urlRouting],
        swiftSettings: .allFeatures
    ),
    .target(
        name: "Eaglet",
        dependencies: ["Eaglet1", "Eaglet2"],
        swiftSettings: .allFeatures
    ),
    .target(
        name: "Eaglet1",
        dependencies: ["Common", casePaths, communication, urlRouting],
        swiftSettings: .allFeatures
    ),
    .target(
        name: "Eaglet2",
        dependencies: ["Common", casePaths, communication, urlRouting],
        swiftSettings: .allFeatures
    )
]

let testTargets: [Target] = targets.map {
    .testTarget(name: "\($0.name)Tests", dependencies: [Target.Dependency(stringLiteral: $0.name)] + $0.dependencies)
}

// MARK: - Products
let products: [Product] = targets.compactMap {
    guard $0.name != "Common" else { return nil }

    return .library(name: $0.name, targets: [$0.name])
}

// MARK: - Supported Platforms
let platforms: [SupportedPlatform] = [
    .macOS(.v13),
    .iOS(.v16)
]

// MARK: - PackageDescription
let package = Package(
    name: "Eaglet",
    platforms: platforms,
    products: products,
    dependencies: dependencies,
    targets: targets + testTargets,
    swiftLanguageModes: [.v6]
)
