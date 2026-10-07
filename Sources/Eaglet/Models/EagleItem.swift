//
//  EagleItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct EagleItem: Codable {
    public typealias FileExtension = String
    public typealias ID = String
    public typealias Tag = String

    public var id: ID
    public var name: String
    public var size: UInt
    public var btime: UInt64
    public var mtime: UInt64
    public var ext: FileExtension
    public var tags: [Tag]
    public var folders: [EagleFolder.ID]
    public var isDeleted: Bool
    public var url: String
    public var annotation: String
    public var modificationTime: UInt
    public var width: Int
    public var height: Int
    public var videoID: String?
    public var medium: String?
    public var duration: String? //UInt?
    public var noThumbnail: Bool?
    public var lastModified: UInt
    public var palettes: [Color]
    public var star: Int?
}

// MARK: EagleItem.Color
public extension EagleItem {
    struct Color: Codable {
        var color: [UInt8]
        var ratio: Double
//        var hashKey: String // Needs to be added back in
    }
}
