//
//  RenameFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing the necessary information to rename a folder in an Eagle Library.
public struct RenameFolder: Codable {
    /// Folder's ID.
    var id: EagleFolder.ID
    /// New name of the folder.
    var newName: String
}

// MARK: Self: Sendable
extension RenameFolder: Sendable {}
