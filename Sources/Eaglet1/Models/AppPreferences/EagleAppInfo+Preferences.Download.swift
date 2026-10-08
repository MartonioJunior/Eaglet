//
//  EagleAppInfo+Preferences.Download.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public extension EagleAppInfo.Preferences {
    struct Download: Codable, Equatable, Sendable {
        public var queueLength: Int
    }
}
