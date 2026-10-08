//
//  EagleFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure representing an Eagle Folder.
public struct EagleFolder: Codable {
    /// Type representing a color in a string-based representation.
    public typealias Color = String
    /// Type representing the folder's identifier.
    public typealias ID = String
    /// Type representing a tag reference in the context of a folder.
    public typealias Tag = String
    /// ID of the folder.
    var id: ID
    /// Name of the folder.
    var name: String
    /// Images associated with this folder
    var images: [EagleImage] // ???
    /// IDs of Sub-folders associated with this folder.
    var folders: [Self.ID]
    var modificationTime: UInt
    /// Is the folder editable?
    var editable: Bool
    var imagesMappings: [Int: Int]
    var tags: [Tag]
    var isExpand: Bool
    var vstype: String
    var guidelines: [String]
    var styles: Styles
    var isVisible: Bool
    var index: Int
    // var hashKey: String // Needs to be added back in
    var newFolderName: String
    /// Number of items in this folder
    var imageCount: Int
    var depth: Int
    var descendantImageCount: Int
    var pinyin: String
    var extendTags: [String]
    var covers: [String]
    var iconColor: Color
    var icon: String
    // var children: [EagleItem]
}

// MARK: EagleFolder.Style
public extension EagleFolder {
    struct Styles: Codable {
        var depth: Int
        var first: Bool
        var last: Bool
    }
}
