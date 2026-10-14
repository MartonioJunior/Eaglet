//
//  EagleAppInfo+Preferences+Proxy.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import EagletCore

public extension EagleAppInfo.Preferences {
    struct Proxy: Codable, Equatable, Sendable {
        public var enable: StringBacked<Bool>
        public var ip: String
        public var port: Int

        public init(
            enable: Bool,
            ip: String,
            port: Int
        ) {
            self.enable = StringBacked(enable)
            self.ip = ip
            self.port = port
        }
    }
}
