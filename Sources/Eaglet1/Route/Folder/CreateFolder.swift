//
//  CreateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing the necessary information to create a folder in an Eagle Library.
public struct CreateFolder: Codable {
    /// Name of the folder.
    var folderName: String
    /// ID of the parent folder.
    var parent: EagleFolder.ID?
}

// MARK: DotSyntax
public extension CreateFolder {
    /// Defines a create folder operation.
    /// - Parameters:
    ///   - name: Name of the folder.
    ///   - parent: ID of the parent folder.
    ///
    /// - Returns: `CreateFolder` object for use with the API bindings.
    static func named(_ name: String, parent: EagleFolder.ID? = nil) -> Self {
        .init(folderName: name, parent: parent)
    }
}

// MARK: Self: Sendable
extension CreateFolder: Sendable {}
