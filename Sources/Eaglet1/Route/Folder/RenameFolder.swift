//
//  RenameFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing the necessary information to rename a folder in an Eagle Library.
public struct RenameFolder {
    /// Folder's ID.
    var id: EagleFolder.ID
    /// New name of the folder.
    var newName: String
}

// MARK: Self.Output
public extension RenameFolder {
    /// Output of a rename folder operation.
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var images: [EagleItem.ID]
        var folders: [EagleFolder.ID]
        var modificationTime: UInt
        var imagesMappings: [String: String] // [String: Any]
        var tags: [EagleTag]
        var children: [EagleFolder.ID]
        var isExpand: Bool
        var size: Int
        var vstype: String
        var styles: EagleStyle
        var isVisible: Bool
        var hashKey: String
        var newFolderName: String
        var editable: Bool
        var pinyin: String
    }
}

extension RenameFolder.Output {
    enum CodingKeys: String, CodingKey {
        case id // swiftlint:disable:this explicit_enum_raw_value
        case name // swiftlint:disable:this explicit_enum_raw_value
        case images // swiftlint:disable:this explicit_enum_raw_value
        case folders // swiftlint:disable:this explicit_enum_raw_value
        case modificationTime // swiftlint:disable:this explicit_enum_raw_value
        case imagesMappings // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case children // swiftlint:disable:this explicit_enum_raw_value
        case isExpand // swiftlint:disable:this explicit_enum_raw_value
        case size // swiftlint:disable:this explicit_enum_raw_value
        case vstype // swiftlint:disable:this explicit_enum_raw_value
        case styles // swiftlint:disable:this explicit_enum_raw_value
        case isVisible // swiftlint:disable:this explicit_enum_raw_value
        case hashKey = "$$hashKey"
        case newFolderName // swiftlint:disable:this explicit_enum_raw_value
        case editable // swiftlint:disable:this explicit_enum_raw_value
        case pinyin // swiftlint:disable:this explicit_enum_raw_value
    }
}

// MARK: Self: Codable
extension RenameFolder: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "folderId"
        case newName // swiftlint:disable:this explicit_enum_raw_value
    }
}

// MARK: Self: Equatable
extension RenameFolder: Equatable {}

// MARK: Self: Sendable
extension RenameFolder: Sendable {}
