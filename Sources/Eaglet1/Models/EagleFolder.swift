//
//  EagleFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct EagleFolder: Codable {
    public typealias Color = String
    public typealias ID = String
    public typealias Tag = String

    var id: ID
    var name: String
    var images: [EagleImage] // ???
    var folders: [EagleFolder.ID]
    var modificationTime: UInt
    var editable: Bool
    var imagesMappings: [Int: Int]
    var tags: [Tag]
    var isExpand: Bool
    var vstype: String
    var guidelines: [String]
    var styles: Styles
    var isVisible: Bool
    var index: Int
//    var hashKey: String // Needs to be added back in
    var newFolderName: String
    var imageCount: Int
    var depth: Int
    var descendantImageCount: Int
    var pinyin: String
    var extendTags: [String]
    var covers: [String]
    var iconColor: Color
    var icon: String
    
//    var children: [EagleItem]
}

// MARK: EagleFolder.Style
public extension EagleFolder {
    struct Styles: Codable {
        var depth: Int
        var first: Bool
        var last: Bool
    }
}
