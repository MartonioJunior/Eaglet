//
//  EagleFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct EagleFolder {
    public let id: String
    public let name: String
    public let description: String
    public let children: [Self]
    public let modificationTime: UInt
    public let tags: [String]
    public let icon: String
    public let iconColor: String?
    public let password: String
    public let passwordTips: String
    public let orderBy: String?
    public let sortIncrease: Bool?
    public let images: [EagleID]
    public let isExpand: Bool
    public let size: UInt
    public let vstype: String
    public let guidelines: [String]
    public let styles: EagleStyle
    public let isVisible: Bool
    public let index: Int
    public let hashKey: String
    public let newFolderName: String
    public let imagesMappings: [String: String]
    public let imageCount: Int
    public let depth: Int
    public let descendantImageCount: Int
    public let pinyin: String
    public let extendTags: [String]
    public let covers: [String]

    public init(
        id: String,
        name: String,
        description: String,
        children: [Self],
        modificationTime: UInt,
        tags: [String],
        icon: String,
        iconColor: String? = nil,
        password: String,
        passwordTips: String,
        orderBy: String? = nil,
        sortIncrease: Bool? = nil,
        images: [EagleID],
        isExpand: Bool,
        size: UInt,
        vstype: String,
        guidelines: [String],
        styles: EagleStyle,
        isVisible: Bool,
        index: Int,
        hashKey: String,
        newFolderName: String,
        imagesMappings: [String: String] = [:],
        imageCount: Int,
        depth: Int,
        descendantImageCount: Int,
        pinyin: String,
        extendTags: [String],
        covers: [String]
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
        self.images = images
        self.isExpand = isExpand
        self.size = size
        self.vstype = vstype
        self.guidelines = guidelines
        self.styles = styles
        self.isVisible = isVisible
        self.index = index
        self.hashKey = hashKey
        self.newFolderName = newFolderName
        self.imagesMappings = imagesMappings
        self.imageCount = imageCount
        self.depth = depth
        self.descendantImageCount = descendantImageCount
        self.pinyin = pinyin
        self.extendTags = extendTags
        self.covers = covers
    }
}

// MARK: Self: Codable
extension EagleFolder: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case children = "children"
        case modificationTime = "modificationTime"
        case tags = "tags"
        case icon = "icon"
        case iconColor = "iconColor"
        case password = "password"
        case passwordTips = "passwordTips"
        case orderBy = "orderBy"
        case sortIncrease = "sortIncrease"
        case images = "images"
        case isExpand = "isExpand"
        case size = "size"
        case vstype = "vstype"
        case guidelines = "guidelines"
        case styles = "styles"
        case isVisible = "isVisible"
        case index = "index"
        case hashKey = "$$hashKey"
        case newFolderName = "newFolderName"
        case imagesMappings = "imagesMappings"
        case imageCount = "imageCount"
        case depth = "depth"
        case descendantImageCount = "descendantImageCount"
        case pinyin = "pinyin"
        case extendTags = "extendTags"
        case covers = "covers"
    }
}

// MARK: Self: Equatable
extension EagleFolder: Equatable {}

// MARK: Self: Sendable
extension EagleFolder: Sendable {}
