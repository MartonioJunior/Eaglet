//
//  EagleSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

/// Type representing a smart folder.
public struct EagleSmartFolder {
    var id: String
    var icon: EagleIcon?
    var iconColor: EagleColor
    var name: String
    var description: String
    var modificationTime: UInt
    var conditions: [Condition]
    var children: [Self]
    var isExpand: Bool
    var depth: UInt
    var size: UInt
    var vstype: String
    var guidelines: [String]
    var styles: EagleStyle
    var isVisible: Bool
    var index: UInt
    var hashKey: String
    var newFolderName: String
    var imageCount: UInt
    var pinyin: String
    var parent: String?
    var orderBy: String?
    var sortIncrease: Bool?
}

// MARK: Self.Condition
public extension EagleSmartFolder {
    struct Condition {
        var hashKey: String?
        var match: String
        var boolean: StringBacked<Bool>
        var rules: [Rule]

        public init(
            rules: [Rule],
            match: String,
            boolean: Bool,
            hashKey: String? = nil
        ) {
            self.rules = rules
            self.match = match
            self.boolean = StringBacked(boolean)
            self.hashKey = hashKey
        }
    }
}

extension EagleSmartFolder.Condition: Codable {
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

extension EagleSmartFolder.Condition: Equatable {}
extension EagleSmartFolder.Condition: Sendable {}

// MARK: Self.Condition.Rule
public extension EagleSmartFolder.Condition {
    struct Rule {
        var hashKey: String?
        var method: String
        var property: String
        nonisolated(unsafe) var value: AnyEagleValue

        public init(
            property: String,
            method: String,
            value: AnyEagleValue,
            hashKey: String? = nil
        ) {
            self.hashKey = hashKey
            self.method = method
            self.property = property
            self.value = value
        }
    }
}

extension EagleSmartFolder.Condition.Rule: Codable {
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

extension EagleSmartFolder.Condition.Rule: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.method == rhs.method
        && lhs.property == rhs.property
        && lhs.hashKey == rhs.hashKey
    }
}

extension EagleSmartFolder.Condition.Rule: Sendable {}

// MARK: Self: Codable
extension EagleSmartFolder: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case icon = "icon"
        case iconColor = "iconColor"
        case name = "name"
        case description = "description"
        case modificationTime = "modificationTime"
        case conditions = "conditions"
        case children = "children"
        case isExpand = "isExpand"
        case depth = "depth"
        case size = "size"
        case vstype = "vstype"
        case guidelines = "guidelines"
        case styles = "styles"
        case isVisible = "isVisible"
        case index = "index"
        case hashKey = "$$hashKey"
        case newFolderName = "newFolderName"
        case imageCount = "imageCount"
        case pinyin = "pinyin"
        case parent = "parent"
        case orderBy = "orderBy"
        case sortIncrease = "sortIncrease"
    }
}

// MARK: Self: Equatable
extension EagleSmartFolder: Equatable {}

// MARK: Self: Sendable
extension EagleSmartFolder: Sendable {}
