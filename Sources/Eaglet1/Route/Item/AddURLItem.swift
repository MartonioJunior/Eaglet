//
//  AddURLItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to add an item in an Eagle Library from an URL.
public struct AddURLItem {
    /// Link of the item to be saved.
    /// 
    /// Supports HTTP, HTTPS and base64.
    var url: String
    /// Name of the item to be added.
    var name: String
    /// Address of the source of items.
    var website: String?
    /// Tags for the items.
    var tags: [String]?
    /// Rating for the item.
    var star: Int?
    /// Annotation for the items.
    var annotation: String?
    /// The creation date of the items.
    /// 
    /// The parameter can be used to alter the items' sorting order in Eagle.
    var modificationTime: Int?
    /// If this parameter is defined, the bookmark will be added to the corresponding folder.
    var folderID: EagleFolder.ID?
    /// Optional, customize the HTTP headers properties.
    /// 
    /// This could be used to circumvent the security of certain websites.
    var headers: [String: String]?
}

// MARK: Self: Codable
extension AddURLItem: Codable {
    enum CodingKeys: String, CodingKey {
        case url // swiftlint:disable:this explicit_enum_raw_value
        case name // swiftlint:disable:this explicit_enum_raw_value
        case website // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case star // swiftlint:disable:this explicit_enum_raw_value
        case annotation // swiftlint:disable:this explicit_enum_raw_value
        case modificationTime // swiftlint:disable:this explicit_enum_raw_value
        case folderID = "folderId"
        case headers // swiftlint:disable:this explicit_enum_raw_value
    }
}

// MARK: Self: Equatable
extension AddURLItem: Equatable {}

// MARK: Self: Sendable
extension AddURLItem: Sendable {}
