//
//  EagleAppInfo+Preferences+Sidebar.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct Sidebar: Codable, Equatable, Sendable {
        public var untagged: StringBacked<Bool>
        public var unfiled: StringBacked<Bool>
        public var recent: StringBacked<Bool>
        public var random: StringBacked<Bool>
        public var community2: StringBacked<Bool>
        public var quickAccess: StringBacked<Bool>
        public var smartFolder: StringBacked<Bool>
        public var folder: StringBacked<Bool>

        public init(
            untagged: Bool,
            unfiled: Bool,
            recent: Bool,
            random: Bool,
            community2: Bool,
            quickAccess: Bool,
            smartFolder: Bool,
            folder: Bool,
        ) {
            self.untagged = StringBacked(untagged)
            self.unfiled = StringBacked(unfiled)
            self.recent = StringBacked(recent)
            self.random = StringBacked(random)
            self.community2 = StringBacked(community2)
            self.quickAccess = StringBacked(quickAccess)
            self.smartFolder = StringBacked(smartFolder)
            self.folder = StringBacked(folder)
        }
    }
}
