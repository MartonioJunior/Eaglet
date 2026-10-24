//
//  EagleItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct EagleItem {
    var id: EagleID
    var name: String
    var size: UInt
    var btime: UInt
    var mtime: UInt?
    var ext: String
    var tags: [String]
    var folders: [EagleID]
    var isDeleted: Bool
    var url: String
    var annotation: String
    var modificationTime: UInt
    var width: UInt
    var height: UInt
    var videoID: EagleID?
    var medium: String?
    var duration: StringBacked<UInt>?
    var lastModified: UInt
    var palettes: [EaglePaletteColor]

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
