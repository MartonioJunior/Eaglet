//
//  UpdateSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct UpdateSmartFolder {
    public var id: EagleID
    public var name: String?
    public var conditions: [EagleSmartFolder.Condition]?
    public var description: String?
    public var iconColor: EagleColor?
    public var icon: EagleIcon?
}

// MARK: Self.Output
public extension UpdateSmartFolder {
    struct Output: Equatable, Sendable {
        public var id: String
        public var name: String
        public var conditions: [EagleSmartFolder.Condition]
        public var description: String
        public var icon: EagleIcon?
        public var iconColor: EagleColor
        public var children: [Self]
        public var modificationTime: UInt
        public var imageCount: UInt
        public var depth: UInt
        public var size: UInt
        public var vstype: String
        public var guidelines: [String]
        public var styles: EagleStyle
        public var index: UInt
        public var hashKey: String
        public var newFolderName: String
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
