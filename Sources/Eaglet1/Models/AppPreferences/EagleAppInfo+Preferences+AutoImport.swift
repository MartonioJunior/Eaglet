//
//  EagleAppInfo+Preferences+AutoImport.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct AutoImport: Codable, Equatable, Sendable {
        public var enable: StringBacked<Bool>
        public var path: String

        public init(
            enable: Bool,
            path: String
        ) {
            self.enable = StringBacked(enable)
            self.path = path
        }
    }
}
