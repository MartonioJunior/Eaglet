//
//  EagleLibrary.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure representing an Eagle Library.
public struct EagleLibrary: Codable {
    /// Type representing a path in the file system.
    public typealias Path = String
    /// Type representing a quick access item.
    public typealias QuickAccess = Never
    /// Type representing a smart folder.
    public typealias SmartFolder = Never
    /// Type representing the version of the app.
    public typealias Version = String
    /// Top-level folder structure.
    var folders: [Folder]
    /// Smart folder configurations.
    var smartFolders: [SmartFolder]
    /// Quick access items.
    var quickAccess: [QuickAccess]
    /// Tag group definitions.
    var tagsGroups: [TagGroups]
    /// Last modification timestamp.
    var modificationTime: UInt
    /// Eagle version that created this library.
    var applicationVersion: Version
    /// Info about the library
    var library: Info
}

// MARK: EagleLibrary.Folder
public extension EagleLibrary {
    /// Data structure representing an Eagle Folder in the context of the library.
    struct Folder: Codable {
        /// Unique folder ID.
        var id: EagleFolder.ID
        /// Name of the folder.
        var name: String
        /// Folder description.
        var description: String
        /// Children folders.
        var children: [EagleFolder.ID]
        /// Last modification timestamp.
        var modificationTime: UInt
        /// Tag names.
        var tags: [EagleTag]
        /// Icon associated with this folder.
        var icon: String
        /// Tint color for the item.
        var iconColor: EagleColor
        /// Password of the item.
        var password: String
        /// Password tips for the password-locked item.
        var passwordTips: String
    }
}

// MARK: EagleLibrary.Info
public extension EagleLibrary {
    /// Data structure containing information about the library.
    struct Info: Codable {
        /// Full path to the library directory.
        var path: Path
        /// Library display name
        var name: String
    }
}

// MARK: EagleLibrary.TagGroups
public extension EagleLibrary {
    /// Data structure representing the model for tag groups.
    struct TagGroups: Codable {
        /// ID of the tag group.
        var id: String
        /// Name of the tag group.
        var name: String
        /// Tags associated with this tag group.
        var tags: [EagleTag]
    }
}
