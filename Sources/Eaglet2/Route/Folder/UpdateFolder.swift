//
//  UpdateFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

import EagletCore

/// Data structure containing the necessary information to update info about a folder in an Eagle Library.
public struct UpdateFolder {
    /// Folder's ID.
    public var id: String
    /// New name of the folder.
    public var name: String?
    /// New description of the folder.
    public var description: String?

    public var tags: [String]?
    /// New color for the folder.
    public var iconColor: EagleColor?

    public var parent: String?
}

// MARK: Self.Output
public extension UpdateFolder {
    /// Output of a update folder operation.
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var description: String
        var images: [EagleID]
        var folders: [String]
        var modificationTime: UInt
        var imagesMappings: [String: String] // [String: Any]
        var tags: [String]
        var children: [UpdateFolder.Output]
        var isExpand: Bool
        var size: Int
        var vstype: String
        var guidelines: [String]
        var styles: EagleStyle
        var isVisible: Bool
        var index: UInt
        var hashKey: String
        var newFolderName: String
        var imageCount: UInt
        var descendantImageCount: UInt
        var pinyin: String
        var extendTags: [String]
        var covers: [String]
    }
}

extension UpdateFolder.Output {
    enum CodingKeys: String, CodingKey {
        case id // swiftlint:disable:this explicit_enum_raw_value
        case name // swiftlint:disable:this explicit_enum_raw_value
        case description // swiftlint:disable:this explicit_enum_raw_value
        case images // swiftlint:disable:this explicit_enum_raw_value
        case folders // swiftlint:disable:this explicit_enum_raw_value
        case modificationTime // swiftlint:disable:this explicit_enum_raw_value
        case imagesMappings // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case children // swiftlint:disable:this explicit_enum_raw_value
        case isExpand // swiftlint:disable:this explicit_enum_raw_value
        case size // swiftlint:disable:this explicit_enum_raw_value
        case vstype // swiftlint:disable:this explicit_enum_raw_value
        case guidelines // swiftlint:disable:this explicit_enum_raw_value
        case styles // swiftlint:disable:this explicit_enum_raw_value
        case isVisible // swiftlint:disable:this explicit_enum_raw_value
        case index // swiftlint:disable:this explicit_enum_raw_value
        case hashKey = "$$hashKey"
        case newFolderName // swiftlint:disable:this explicit_enum_raw_value
        case imageCount // swiftlint:disable:this explicit_enum_raw_value
        case descendantImageCount // swiftlint:disable:this explicit_enum_raw_value
        case pinyin // swiftlint:disable:this explicit_enum_raw_value
        case extendTags // swiftlint:disable:this explicit_enum_raw_value
        case covers // swiftlint:disable:this explicit_enum_raw_value
    }
}

// MARK: Self: Codable
extension UpdateFolder: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name // swiftlint:disable:this explicit_enum_raw_value
        case description // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case iconColor // swiftlint:disable:this explicit_enum_raw_value
        case parent // swiftlint:disable:this explicit_enum_raw_value
    }
}

// MARK: Self: Equatable
extension UpdateFolder: Equatable {}

// MARK: Self: Sendable
extension UpdateFolder: Sendable {}
