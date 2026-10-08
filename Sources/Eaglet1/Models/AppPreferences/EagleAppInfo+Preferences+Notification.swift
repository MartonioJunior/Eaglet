//
//  EagleAppInfo+Preferences+Notification.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct Notification: Codable, Equatable, Sendable {
        public var soundEffect: Setting
        public var notification: Setting
    }
}

// MARK: Self.Setting
public extension EagleAppInfo.Preferences.Notification {
    struct Setting: Codable, Equatable, Sendable {
        public var enable: StringBacked<Bool>?
        public var when: [String: StringBacked<Bool>]

        public init(
            enable: Bool,
            when: [String: Bool]
        ) {
            self.enable = StringBacked(enable)
            self.when = when.mapValues(StringBacked.init)
        }
    }
}
