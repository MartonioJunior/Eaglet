//
//  EagleItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import EagletCore

/// Data structure representing an Eagle Item.
public struct EagleItem {
    /// Type representing the file extension for the type.
    public typealias FileExtension = String
    /// Type representing the item's identifier.
    public typealias ID = String
    /// Type representing a reference to a tag in the context of an item.
    public typealias Tag = String
    /// ID of the item.
    public var id: ID
    /// Name of the item.
    public var name: String
    /// File size for the item.
    public var size: UInt
    /// Birth time.
    public var btime: UInt64?
    /// Modify time.
    public var mtime: UInt64?
    /// File extension of the item.
    public var ext: FileExtension
    /// Tags associated with the item.
    public var tags: [Tag]
    /// Folders which the item is part of.
    public var folders: [EagleFolder.ID]
    /// Is the item currently in the trash?
    public var isDeleted: Bool
    /// Address for a source/website associated with the item.
    public var url: String
    /// Annotation for the item.
    public var annotation: String
    /// Last modification timestamp.
    public var modificationTime: UInt
    /// Width of the item.
    /// 
    /// Only works with local image and video files.
    public var width: Int
    /// Height of the item.
    /// 
    /// Only works with local image and video files.
    public var height: Int
    /// ID of the video in a platform (e.g. YouTube).
    public var videoID: String?
    /// Medium where the item comes from.
    public var medium: String?
    /// Duration of the video and/or audio clip.
    public var duration: StringBacked<UInt>?
    /// Does this item have a thumbnail?
    public var noThumbnail: Bool?
    /// Last modification timestamp.
    public var lastModified: UInt
    /// Palette of colors associated with this item.
    public var palettes: [PaletteColor]
    /// Star Rating for this item.
    /// 
    /// `nil` indicates that the item has yet to get a rating
    public var star: Int?
}

// MARK: EagleItem.Color
public extension EagleItem {
    /// Color in the palette of an Eagle item.
    typealias PaletteColor = EaglePaletteColor
}

// MARK: Self: Codable
extension EagleItem: Codable {}

// MARK: Self: Equatable
extension EagleItem: Equatable {}

// MARK: Self: Sendable
extension EagleItem: Sendable {}
