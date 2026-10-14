//
//  EagleLibrary.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import EagletCore

/// Data structure representing an Eagle Library.
public struct EagleLibrary {
    /// Type representing a path in the file system.
    public typealias Path = String
    /// Type representing the version of the app.
    public typealias Version = String
    /// Top-level folder structure.
    var folders: [Folder]
    /// Smart folder configurations.
    var smartFolders: [SmartFolder]
    /// Quick access items.
    var quickAccess: [QuickAccess]
    /// Tag group definitions.
    var tagsGroups: [TagGroups]
    /// Last modification timestamp.
    var modificationTime: UInt
    /// Eagle version that created this library.
    var applicationVersion: Version
    /// Info about the library
    var info: Info
}

// MARK: EagleLibrary.Folder
public extension EagleLibrary {
    /// Data structure representing an Eagle Folder in the context of the library.
    struct Folder {
        /// Unique folder ID.
        var id: EagleFolder.ID
        /// Name of the folder.
        var name: String
        /// Folder description.
        var description: String
        /// Children folders.
        var children: [EagleLibrary.Folder]
        /// Last modification timestamp.
        var modificationTime: UInt
        /// Tag names.
        var tags: [EagleTag]
        /// Icon associated with this folder.
        var icon: String?
        /// Tint color for the item.
        var iconColor: EagleColor?
        /// Password of the item.
        var password: String
        /// Password tips for the password-locked item.
        var passwordTips: String

        var coverId: String?

        var orderBy: String?

        var sortIncrease: Bool?
    }
}

extension EagleLibrary.Folder: Codable {}
extension EagleLibrary.Folder: Equatable {}
extension EagleLibrary.Folder: Sendable {}

// MARK: EagleLibrary.Info
public extension EagleLibrary {
    /// Data structure containing information about the library.
    struct Info {
        /// Full path to the library directory.
        var path: Path
        /// Library display name
        var name: String
    }
}

extension EagleLibrary.Info: Codable {}
extension EagleLibrary.Info: Equatable {}
extension EagleLibrary.Info: Sendable {}

// MARK: EagleLibrary.QuickAccess
public extension EagleLibrary {
    /// Type representing a quick access item.
    struct QuickAccess {
        var type: String
        var id: String
    }
}

extension EagleLibrary.QuickAccess: Codable {}
extension EagleLibrary.QuickAccess: Equatable {}
extension EagleLibrary.QuickAccess: Sendable {}

// MARK: EagleLibrary.SmartFolder
public extension EagleLibrary {
    /// Type representing a smart folder.
    struct SmartFolder {
        var id: String
        var icon: EagleIcon?
        var name: String
        var description: String
        var modificationTime: UInt
        var conditions: [Condition]
        var orderBy: String?
        var sortIncrease: Bool?

        struct Condition {
            var hashKey: String?
            var match: String
            var rules: [Rule]

            struct Rule {
                var hashKey: String?
                var method: String
                var property: String
                nonisolated(unsafe) var value: AnyEagleValue
            }
        }
    }
}

extension EagleLibrary.SmartFolder: Codable {}
extension EagleLibrary.SmartFolder: Equatable {}
extension EagleLibrary.SmartFolder: Sendable {}

extension EagleLibrary.SmartFolder.Condition: Codable {
    enum CodingKeys: String, CodingKey {
        case hashKey = "$$hashKey"
        case match
        case rules
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(match, forKey: .match)
        try container.encode(rules, forKey: .rules)
        try container.encode(hashKey, forKey: .hashKey)
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hashKey = try container.decodeIfPresent(String.self, forKey: .hashKey)
        self.match = try container.decode(String.self, forKey: .match)
        self.rules = try container.decode([Rule].self, forKey: .rules)
    }
}

extension EagleLibrary.SmartFolder.Condition: Equatable {}
extension EagleLibrary.SmartFolder.Condition: Sendable {}

extension EagleLibrary.SmartFolder.Condition.Rule: Codable {
    enum CodingKeys: String, CodingKey {
        case hashKey = "$$hashKey"
        case method
        case property
        case value
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(method, forKey: .method)
        try container.encode(property, forKey: .property)
        try container.encode(value, forKey: .value)
        try container.encode(hashKey, forKey: .hashKey)
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hashKey = try container.decodeIfPresent(String.self, forKey: .hashKey)
        self.method = try container.decode(String.self, forKey: .method)
        self.property = try container.decode(String.self, forKey: .property)
        self.value = try container.decode(AnyEagleValue.self, forKey: .value)
    }
}

extension EagleLibrary.SmartFolder.Condition.Rule: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.method == rhs.method
        && lhs.property == rhs.property
        && lhs.hashKey == rhs.hashKey
    }
}

extension EagleLibrary.SmartFolder.Condition.Rule: Sendable {}

// MARK: EagleLibrary.TagGroups
public extension EagleLibrary {
    /// Data structure representing the model for tag groups.
    struct TagGroups {
        /// ID of the tag group.
        var id: String
        /// Name of the tag group.
        var name: String
        /// Tags associated with this tag group.
        var tags: [EagleTag]

        var color: EagleColor?
    }
}

extension EagleLibrary.TagGroups: Codable {}
extension EagleLibrary.TagGroups: Equatable {}
extension EagleLibrary.TagGroups: Sendable {}

// MARK: Self: Decodable
extension EagleLibrary: Decodable {}

// MARK: Self: Encodable
extension EagleLibrary: Encodable {}

// MARK: Self: Equatable
extension EagleLibrary: Equatable {}

// MARK: Self: Sendable
extension EagleLibrary: Sendable {}
