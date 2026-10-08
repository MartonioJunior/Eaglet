//
//  EagleAppInfo+Preferences+Privacy.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct Privacy: Codable, Equatable, Sendable {
        public var enable: StringBacked<Bool>
        public var password: String
        public var passwordTips: String

        public var isEnabled: Bool {
            get { enable.value }
            set { enable.value = newValue }
        }

        public init(
            enable: Bool,
            password: String,
            passwordTips: String
        ) {
            self.enable = StringBacked(enable)
            self.password = password
            self.passwordTips = passwordTips
        }
    }
}
