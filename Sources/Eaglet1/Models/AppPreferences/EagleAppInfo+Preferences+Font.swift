//
//  EagleAppInfo+Preferences+Font.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import EagletCore

public extension EagleAppInfo.Preferences {
    struct Font: Codable, Equatable, Sendable {
        public var autoTag: StringBacked<Bool>

        public init(autoTag: Bool) {
            self.autoTag = StringBacked(autoTag)
        }
    }
}
