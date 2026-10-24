//
//  AddItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AddItem {
    /// Image URL (at least one of: url, path, base64, bookmarkURL)
    var url: String?
    /// Local file path
    var path: String?
    /// Base64-encoded image data
    var base64: String?
    /// Bookmark URL
    var bookmarkURL: String?
    /// Item name
    var name: String?
    /// Source website URL
    var website: String?
    /// Tags array
    var tags: [String]?
    /// Annotation
    var annotation: String?
    /// Target folder IDs
    var folders: [String]?
    /// Rating (0-5)
    var star: UInt?
    /// Batch mode: items array (max 1000)
    var items: [String: String]?
}

// MARK: Self.Output
public extension AddItem {
    struct Output: Codable, Equatable, Sendable {
        var id: EagleID
    }
}

// MARK: Self: Codable
extension AddItem: Codable {}

// MARK: Self: Equatable
extension AddItem: Equatable {}

// MARK: Self: Sendable
extension AddItem: Sendable {}
