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
    public var name: String

    public var description: String?
    /// ID of the parent folder.
    public var parent: EagleID?

    public var iconColor: EagleColor?
}

// MARK: Self.Output
public extension CreateFolder {
    /// Output response from the create folder operation.
    struct Output: Codable, Equatable, Sendable {
        public var id: String
        public var name: String
        public var images: [EagleID]
        public var folders: [EagleID]
        public var modificationTime: UInt
        public var imagesMappings: [String: String] // [String: Any]
        public var tags: [String]
        public var children: [EagleID]
        public var isExpand: Bool
    }
}

// MARK: Self: Codable
extension CreateFolder: Codable {}

// MARK: Self: Equatable
extension CreateFolder: Equatable {}

// MARK: Self: Sendable
extension CreateFolder: Sendable {}
