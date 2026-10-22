//
//  EagleFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 14/04/25.
//

import EagletCore

public enum EagleFolder {
    /// Type representing the folder's identifier.
    public typealias ID = String
}

// MARK: Self.ListItem
public extension EagleFolder {
    struct ListItem: Codable, Equatable, Sendable {
        /// ID of the folder.
        var id: ID
        /// Name of the folder.
        var name: String
        /// Description for the folder.
        var description: String
        /// Sub-folders associated with this folder.
        var children: [Self]
        var modificationTime: UInt
        /// List of tags associated with a folder
        var tags: [String]
        /// List of tags to extend.
        var extendTags: [String]
        /// Icon for the folder.
        var icon: EagleIcon
        /// Color for the folder's icon.
        var iconColor: EagleColor
        var pinyin: String
        /// Password for accessing the folder.
        var password: String
        /// Tips for the password of the folder.
        var passwordTips: String
    }
}

// MARK: Self.RecentItem
public extension EagleFolder {
    struct RecentItem: Codable, Equatable, Sendable {
        let id: String
        let name: String
        let images: [EagleItem.ID]
        let folders: [Self]
        let modificationTime: UInt
        let editable: Bool
        let imagesMappings: [String: String]
        let tags: [String]
        let children: [Self]
        let isExpand: Bool
        let parent: String
        let icon: String
        let iconColor: String
        let size: Int
        let vstype: String
        let guidelines: [String]
        let styles: EagleStyle
        let isVisible: Bool
        let index: Int
        let hashKey: String
        let newFolderName: String
        let imageCount: Int
        let depth: Int
        let descendantImageCount: Int
        let pinyin: String
        let extendTags: [String]
        let covers: [String]

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case images = "images"
            case folders = "folders"
            case modificationTime = "modificationTime"
            case editable = "editable"
            case imagesMappings = "imagesMappings"
            case tags = "tags"
            case children = "children"
            case isExpand = "isExpand"
            case parent = "parent"
            case icon = "icon"
            case iconColor = "iconColor"
            case size = "size"
            case vstype = "vstype"
            case guidelines = "guidelines"
            case styles = "styles"
            case isVisible = "isVisible"
            case index = "index"
            case hashKey = "$$hashKey"
            case newFolderName = "newFolderName"
            case imageCount = "imageCount"
            case depth = "depth"
            case descendantImageCount = "descendantImageCount"
            case pinyin = "pinyin"
            case extendTags = "extendTags"
            case covers = "covers"
        }
    }
}
