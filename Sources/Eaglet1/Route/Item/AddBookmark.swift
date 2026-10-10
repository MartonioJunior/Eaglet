//
//  AddBookmark.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to add a bookmark in an Eagle Library.
public struct AddBookmark {
    /// Link of the bookmark to be saved.
    /// 
    /// Supports HTTP, HTTPS and base64.
    var url: String
    /// Name of the bookmark to be added.
    var name: String
    /// Thumbnail of the bookmark.
    /// 
    /// Must be in base64 format.
    var base64: String?
    /// Tags for the bookmark.
    var tags: [String]?
    /// Creation date of the bookmarks.
    /// 
    /// The parameter can be used to alter the bookmarks' sorting order in Eagle. 
    var modificationTime: Int?
    /// If this parameter is defined, the bookmark will be added to the corresponding folder.
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddBookmark: Codable {
    enum CodingKeys: String, CodingKey {
        case url // swiftlint:disable:this explicit_enum_raw_value
        case name // swiftlint:disable:this explicit_enum_raw_value
        case base64 // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case modificationTime // swiftlint:disable:this explicit_enum_raw_value
        case folderID = "folderId"
    }
}

// MARK: Self: Equatable
extension AddBookmark: Equatable {}

// MARK: Self: Sendable
extension AddBookmark: Sendable {}
