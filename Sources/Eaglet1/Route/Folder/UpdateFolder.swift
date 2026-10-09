//
//  UpdateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing the necessary information to update info about a folder in an Eagle Library.
public struct UpdateFolder {
    /// Folder's ID.
    var id: EagleFolder.ID
    /// New name of the folder.
    var newName: String?
    /// New description of the folder.
    var newDescription: String?
    /// New color for the folder.
    var newColor: EagleColor?
}

// MARK: Self.Output
public extension UpdateFolder {
    /// Output of a rename folder operation.
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var description: String
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
        var editable: Bool
    }
}

// MARK: Self: Codable
extension UpdateFolder: Codable {}

// MARK: Self: Equatable
extension UpdateFolder: Equatable {}

// MARK: Self: Sendable
extension UpdateFolder: Sendable {}
