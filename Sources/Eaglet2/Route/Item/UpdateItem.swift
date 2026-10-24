//
//  UpdateItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct UpdateItem {
    var id: EagleID
    var name: String
    var annotation: String
    var url: String
    var tags: [String]
    var folders: [EagleID]
    var star: UInt
    var ext: String
    var width: UInt
    var height: UInt
    var noThumbnail: Bool
    var noPreview: Bool
    var isDeleted: Bool
    var modificationTime: UInt
}

// MARK: Self.Output
public extension UpdateItem {
    struct Output: Codable, Equatable, Sendable {
        var id: EagleID
        var name: String
        var size: UInt
        var btime: UInt
        var mtime: UInt
        var ext: String
        var tags: [String]
        var folders: [EagleID]
        var isDeleted: Bool
        var url: String
        var annotation: String
        var modificationTime: UInt
        var height: UInt
        var width: UInt
        var noThumbnail: Bool
        var palettes: [EaglePaletteColor]
        var lastModified: UInt
    }
}

// MARK: Self: Codable
extension UpdateItem: Codable {}

// MARK: Self: Equatable
extension UpdateItem: Equatable {}

// MARK: Self: Sendable
extension UpdateItem: Sendable {}
