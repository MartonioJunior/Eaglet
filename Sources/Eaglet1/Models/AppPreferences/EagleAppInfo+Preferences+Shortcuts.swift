//
//  EagleAppInfo+Preferences+Shortcuts.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public extension EagleAppInfo.Preferences {
    struct Shortcuts: Codable, Equatable, Sendable {
        public var keybinds: [String: String]
    }
}