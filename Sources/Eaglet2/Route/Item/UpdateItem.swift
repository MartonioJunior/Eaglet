//
//  UpdateItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct UpdateItem {
    public var id: EagleID
    public var name: String?
    public var annotation: String?
    public var url: String?
    public var tags: [String]?
    public var folders: [EagleID]?
    public var star: UInt?
    public var ext: String?
    public var width: UInt?
    public var height: UInt?
    public var noThumbnail: Bool?
    public var noPreview: Bool?
    public var isDeleted: Bool?
    public var modificationTime: UInt?
}

// MARK: Self.Output
public extension UpdateItem {
    struct Output: Codable, Equatable, Sendable {
        public var id: EagleID
        public var name: String
        public var size: UInt
        public var btime: UInt
        public var mtime: UInt
        public var ext: String
        public var tags: [String]
        public var folders: [EagleID]
        public var isDeleted: Bool
        public var url: String
        public var annotation: String
        public var modificationTime: UInt
        public var height: UInt
        public var width: UInt
        public var noThumbnail: Bool
        public var palettes: [EaglePaletteColor]
        public var lastModified: UInt
    }
}

// MARK: Self: Codable
extension UpdateItem: Codable {}

// MARK: Self: Equatable
extension UpdateItem: Equatable {}

// MARK: Self: Sendable
extension UpdateItem: Sendable {}
