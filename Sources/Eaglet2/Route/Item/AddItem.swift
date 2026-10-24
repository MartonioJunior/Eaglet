//
//  AddItem.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AddItem {
    /// Image URL (at least one of: url, path, base64, bookmarkURL)
    public var url: String?
    /// Local file path
    public var path: String?
    /// Base64-encoded image data
    public var base64: String?
    /// Bookmark URL
    public var bookmarkURL: String?
    /// Item name
    public var name: String?
    /// Source website URL
    public var website: String?
    /// Tags array
    public var tags: [String]?
    /// Annotation
    public var annotation: String?
    /// Target folder IDs
    public var folders: [String]?
    /// Rating (0-5)
    public var star: UInt?
    /// Batch mode: items array (max 1000)
    public var items: [String: String]?
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
