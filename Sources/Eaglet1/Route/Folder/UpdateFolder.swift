//
//  UpdateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing the necessary information to update info about a folder in an Eagle Library.
public struct UpdateFolder: Codable {
    /// Folder's ID.
    var id: EagleFolder.ID
    /// New name of the folder.
    var newName: String?
    /// New description of the folder.
    var newDescription: String?
    /// New color for the folder.
    var newColor: EagleFolder.Color?
}

// MARK: Self: Sendable
extension UpdateFolder: Sendable {}
