//
//  UpdateSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct UpdateSmartFolder {
    var id: EagleID
    var name: String?
    var conditions: [EagleSmartFolder.Condition]?
    var description: String?
    var iconColor: EagleColor?
    var icon: EagleIcon?
}

// MARK: Self.Output
public extension UpdateSmartFolder {
    struct Output: Equatable, Sendable {
        var id: String
        var name: String
        var conditions: [EagleSmartFolder.Condition]
        var description: String
        var icon: EagleIcon?
        var iconColor: EagleColor
        var children: [Self]
        var modificationTime: UInt
        var imageCount: UInt
        var depth: UInt
        var size: UInt
        var vstype: String
        var guidelines: [String]
        var styles: EagleStyle
        var index: UInt
        var hashKey: String
        var newFolderName: String
    }
}

extension UpdateSmartFolder.Output: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case icon = "icon"
        case iconColor = "iconColor"
        case name = "name"
        case description = "description"
        case modificationTime = "modificationTime"
        case conditions = "conditions"
        case children = "children"
        case depth = "depth"
        case size = "size"
        case vstype = "vstype"
        case guidelines = "guidelines"
        case styles = "styles"
        case index = "index"
        case hashKey = "$$hashKey"
        case newFolderName = "newFolderName"
        case imageCount = "imageCount"
    }
}

// MARK: Self: Codable
extension UpdateSmartFolder: Codable {}

// MARK: Self: Equatable
extension UpdateSmartFolder: Equatable {}

// MARK: Self: Sendable
extension UpdateSmartFolder: Sendable {}
