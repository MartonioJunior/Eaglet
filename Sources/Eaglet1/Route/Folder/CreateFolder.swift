//
//  CreateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

import EagletCore

/// Data structure containing the necessary information to create a folder in an Eagle Library.
public struct CreateFolder {
    /// Name of the folder.
    var folderName: String
    /// ID of the parent folder.
    var parent: EagleFolder.ID?
    /// Defines a create folder operation.
    /// - Parameters:
    ///   - name: Name of the folder.
    ///   - parent: ID of the parent folder.
    public init(named folderName: String, parent: EagleFolder.ID? = nil) {
        self.folderName = folderName
        self.parent = parent
    }
}

// MARK: Self.Output
public extension CreateFolder {
    /// Output response from the create folder operation.
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var images: [EagleItem.ID]
        var folders: [EagleFolder.ID]
        var modificationTime: UInt
        var imagesMappings: [String: String] // [String: Any]
        var tags: [String]
        var children: [EagleFolder.ID]
        var isExpand: Bool
    }
}

// MARK: Self: Codable
extension CreateFolder: Codable {}

// MARK: Self: Equatable
extension CreateFolder: Equatable {}

// MARK: Self: Sendable
extension CreateFolder: Sendable {}
