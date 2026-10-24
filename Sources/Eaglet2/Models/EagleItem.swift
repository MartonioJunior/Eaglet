//
//  EagleItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct EagleItem {
    public var id: EagleID
    public var name: String
    public var size: UInt
    public var btime: UInt
    public var mtime: UInt?
    public var ext: String
    public var tags: [String]
    public var folders: [EagleID]
    public var isDeleted: Bool
    public var url: String
    public var annotation: String
    public var modificationTime: UInt
    public var width: UInt
    public var height: UInt
    public var videoID: EagleID?
    public var medium: String?
    public var duration: StringBacked<UInt>?
    public var lastModified: UInt
    public var palettes: [EaglePaletteColor]

    public init(
        id: EagleID,
        name: String,
        size: UInt,
        btime: UInt,
        mtime: UInt? = nil,
        ext: String,
        tags: [String],
        folders: [EagleID],
        isDeleted: Bool,
        url: String,
        annotation: String,
        modificationTime: UInt,
        width: UInt,
        height: UInt,
        videoID: EagleID? = nil,
        medium: String? = nil,
        duration: UInt? = nil,
        lastModified: UInt,
        palettes: [EaglePaletteColor]
    ) {
        self.id = id
        self.name = name
        self.size = size
        self.btime = btime
        self.mtime = mtime
        self.ext = ext
        self.tags = tags
        self.folders = folders
        self.isDeleted = isDeleted
        self.url = url
        self.annotation = annotation
        self.modificationTime = modificationTime
        self.width = width
        self.height = height
        self.videoID = videoID
        self.medium = medium
        self.duration = nil
        if let duration {
            self.duration = StringBacked(duration)
        }
        self.lastModified = lastModified
        self.palettes = palettes
    }
}

// MARK: Self: Codable
extension EagleItem: Codable {}

// MARK: Self: Equatable
extension EagleItem: Equatable {}

// MARK: Self: Sendable
extension EagleItem: Sendable {}
