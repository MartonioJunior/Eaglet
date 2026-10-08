//
//  EagleLibrary.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct EagleLibrary: Codable {
    public typealias Path = String
    public typealias QuickAccess = Never
    public typealias SmartFolder = Never
    public typealias Version = Never
    
    var folders: [Folder]
    var smartFolders: [SmartFolder]
    var quickAccess: [QuickAccess]
    var tagsGroups: [TagGroups]
    var modificationTime: UInt
    var applicationVersion: String
    var library: Info
}

// MARK: EagleLibrary.Folder
public extension EagleLibrary {
    struct Folder: Codable {
        var id: EagleFolder.ID
        var name: String
        var description: String
        var children: [EagleFolder.ID]
        var modificationTime: UInt
        var tags: [EagleFolder.Tag]
        var icon: String
        var iconColor: EagleFolder.Color
        var password: String
        var passwordTips: String
    }
}

// MARK: EagleLibrary.Info
public extension EagleLibrary {
    struct Info: Codable {
        var path: Path
        var name: String
    }
}

// MARK: EagleLibrary.TagGroups
public extension EagleLibrary {
    struct TagGroups: Codable {
        var id: String
        var name: String
        var tags: [EagleFolder.Tag]
    }
}
