//
//  EagleLibrary.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

/// Data structure representing an Eagle Library.
public struct EagleLibrary {
    /// Type representing a path in the file system.
    public typealias Path = String
    /// Type representing the version of the app.
    public typealias Version = String
    /// Library display name.
    var name: String
    /// Full path to the library directory.
    var path: String
    /// Last modification timestamp.
    var modificationTime: UInt
    /// Eagle version that created this library.
    var applicationVersion: Version
    /// Top-level folder structure.
    var folders: [Folder]
    /// Smart folder configurations.
    var smartFolders: [SmartFolder]
    /// Quick access items.
    var quickAccess: [QuickAccess]
    /// Tag group definitions.
    var tagsGroups: [TagGroups]
}

// MARK: EagleLibrary.Folder
public extension EagleLibrary {
    /// Data structure representing an Eagle Folder in the context of the library.
    struct Folder {
        /// Unique folder ID.
        var id: String
        /// Name of the folder.
        var name: String
        /// Folder description.
        var description: String
        /// Children folders.
        var children: [EagleLibrary.Folder]
        /// Last modification timestamp.
        var modificationTime: UInt
        /// Tag names.
        var tags: [String]
        /// Icon associated with this folder.
        var icon: String?
        /// Tint color for the item.
        var iconColor: EagleColor?
        /// Password of the item.
        var password: String
        /// Password tips for the password-locked item.
        var passwordTips: String

        var orderBy: String?

        var sortIncrease: Bool?

        public init(
            id: String,
            name: String,
            description: String,
            children: [EagleLibrary.Folder],
            modificationTime: UInt,
            tags: [String],
            icon: String? = nil,
            iconColor: EagleColor? = nil,
            password: String,
            passwordTips: String,
            orderBy: String? = nil,
            sortIncrease: Bool? = nil
        ) {
            self.id = id
            self.name = name
            self.description = description
            self.children = children
            self.modificationTime = modificationTime
            self.tags = tags
            self.icon = icon
            self.iconColor = iconColor
            self.password = password
            self.passwordTips = passwordTips
            self.orderBy = orderBy
            self.sortIncrease = sortIncrease
        }
    }
}

extension EagleLibrary.Folder: Codable {}
extension EagleLibrary.Folder: Equatable {}
extension EagleLibrary.Folder: Sendable {}

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
        var iconColor: EagleColor
        var name: String
        var description: String?
        var modificationTime: UInt
        var conditions: [Condition]
        var children: [EagleLibrary.SmartFolder]
        var orderBy: String?
        var sortIncrease: Bool?
        var isExpand: Bool?
        var depth: UInt?
        var size: UInt?
        var vstype: String?
        var guidelines: [String]?
        var styles: EagleStyle?
        var isVisible: Bool?
        var index: UInt?
        var imageCount: UInt?
        var pinyin: String?
        var parent: String?

        public init(
            id: String,
            icon: EagleIcon?,
            iconColor: EagleColor,
            name: String,
            description: String? = nil,
            modificationTime: UInt,
            conditions: [Condition],
            children: [EagleLibrary.SmartFolder],
            orderBy: String? = nil,
            sortIncrease: Bool? = nil,
            isExpand: Bool? = nil,
            depth: UInt? = nil,
            size: UInt? = nil,
            vstype: String? = nil,
            guidelines: [String]? = nil,
            styles: EagleStyle? = nil,
            isVisible: Bool? = nil,
            index: UInt? = nil,
            imageCount: UInt? = nil,
            pinyin: String? = nil,
            parent: String? = nil
        ) {
            self.id = id
            self.icon = icon
            self.iconColor = iconColor
            self.name = name
            self.description = description
            self.modificationTime = modificationTime
            self.conditions = conditions
            self.children = children
            self.orderBy = orderBy
            self.sortIncrease = sortIncrease
            self.isExpand = isExpand
            self.depth = depth
            self.size = size
            self.vstype = vstype
            self.guidelines = guidelines
            self.styles = styles
            self.isVisible = isVisible
            self.index = index
            self.imageCount = imageCount
            self.pinyin = pinyin
            self.parent = parent
        }
    }
}

extension EagleLibrary.SmartFolder: Codable {}
extension EagleLibrary.SmartFolder: Equatable {}
extension EagleLibrary.SmartFolder: Sendable {}

public extension EagleLibrary.SmartFolder {
    struct Condition {
        var hashKey: String?
        var match: String
        var boolean: StringBacked<Bool>
        var rules: [Rule]

        public init(
            hashKey: String?,
            match: String,
            boolean: Bool,
            rules: [Rule]
        ) {
            self.hashKey = hashKey
            self.match = match
            self.boolean = StringBacked(boolean)
            self.rules = rules
        }
    }
}

extension EagleLibrary.SmartFolder.Condition: Codable {
    enum CodingKeys: String, CodingKey {
        case hashKey = "$$hashKey"
        case match
        case boolean
        case rules
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(match, forKey: .match)
        try container.encode(boolean, forKey: .boolean)
        try container.encode(rules, forKey: .rules)
        try container.encode(hashKey, forKey: .hashKey)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hashKey = try container.decodeIfPresent(String.self, forKey: .hashKey)
        self.match = try container.decode(String.self, forKey: .match)
        do {
            self.boolean = try container.decode(StringBacked<Bool>.self, forKey: .boolean)
        } catch {
            self.boolean = StringBacked.bool(try container.decode(String.self, forKey: .boolean))
        }
        self.rules = try container.decode([Rule].self, forKey: .rules)
    }
}

extension EagleLibrary.SmartFolder.Condition: Equatable {}
extension EagleLibrary.SmartFolder.Condition: Sendable {}

public extension EagleLibrary.SmartFolder.Condition {
    struct Rule {
        var hashKey: String?
        var method: String
        var property: String
        nonisolated(unsafe) var value: AnyEagleValue

        public init(
            hashKey: String?,
            method: String,
            property: String,
            value: AnyEagleValue
        ) {
            self.hashKey = hashKey
            self.method = method
            self.property = property
            self.value = value
        }
    }
}

extension EagleLibrary.SmartFolder.Condition.Rule: Codable {
    enum CodingKeys: String, CodingKey {
        case hashKey = "$$hashKey"
        case method
        case property
        case value
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(method, forKey: .method)
        try container.encode(property, forKey: .property)
        try container.encode(value, forKey: .value)
        try container.encode(hashKey, forKey: .hashKey)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hashKey = try container.decodeIfPresent(String.self, forKey: .hashKey)
        self.method = try container.decode(String.self, forKey: .method)
        self.property = try container.decode(String.self, forKey: .property)
        self.value = try container.decode(AnyEagleValue.self, forKey: .value)
    }
}

extension EagleLibrary.SmartFolder.Condition.Rule: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
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
        var tags: [String]

        var color: EagleColor?

        var description: String?
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
