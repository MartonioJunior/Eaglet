//
//  AddPathItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to add an item in an Eagle Library from an URL.
public struct AddPathItem {
    /// Path of the local file.
    var path: String
    /// Name of the item to be added.
    var name: String
    /// Address of the source of the item.
    var website: String?
    /// Annotation for the item.
    var annotation: String?
    /// Tags for the item.
    var tags: [String]?
    /// If this parameter is defined, the item will be added to the corresponding folder.
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddPathItem: Codable {
    enum CodingKeys: String, CodingKey {
        case path // swiftlint:disable:this explicit_enum_raw_value
        case name // swiftlint:disable:this explicit_enum_raw_value
        case website // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case annotation // swiftlint:disable:this explicit_enum_raw_value
        case folderID = "folderId"
    }
}

// MARK: Self: Equatable
extension AddPathItem: Equatable {}

// MARK: Self: Sendable
extension AddPathItem: Sendable {}
