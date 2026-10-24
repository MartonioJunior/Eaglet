//
//  CreateFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

import EagletCore

/// Data structure containing the necessary information to create a folder in an Eagle Library.
public struct CreateFolder {
    /// Name of the folder.
    var name: String

    var description: String?
    /// ID of the parent folder.
    var parent: EagleID?

    var iconColor: EagleColor?
}

// MARK: Self.Output
public extension CreateFolder {
    /// Output response from the create folder operation.
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var images: [EagleID]
        var folders: [EagleID]
        var modificationTime: UInt
        var imagesMappings: [String: String] // [String: Any]
        var tags: [String]
        var children: [EagleID]
        var isExpand: Bool
    }
}

// MARK: Self: Codable
extension CreateFolder: Codable {}

// MARK: Self: Equatable
extension CreateFolder: Equatable {}

// MARK: Self: Sendable
extension CreateFolder: Sendable {}
