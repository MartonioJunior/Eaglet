//
//  EagleFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct EagleFolder {
    let id: String
    let name: String
    let description: String
    let children: [Self]
    let modificationTime: UInt
    let tags: [String]
    let icon: String
    let iconColor: String?
    let password: String
    let passwordTips: String
    let orderBy: String?
    let sortIncrease: Bool?
    let images: [EagleID]
    let isExpand: Bool
    let size: UInt
    let vstype: String
    let guidelines: [String]
    let styles: EagleStyle
    let isVisible: Bool
    let index: Int
    let hashKey: String
    let newFolderName: String
    let imagesMappings: [String: String]
    let imageCount: Int
    let depth: Int
    let descendantImageCount: Int
    let pinyin: String
    let extendTags: [String]
    let covers: [String]

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
