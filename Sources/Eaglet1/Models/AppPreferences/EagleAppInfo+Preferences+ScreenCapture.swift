//
//  EagleAppInfo+Preferences+ScreenCapture.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct ScreenCapture: Codable, Equatable, Sendable {
        public var autoTagging: AutoTag
        public var autoWriteClipboard: StringBacked<Bool>
        public var useRetina: StringBacked<Bool>
        public var shortcutsEnable: StringBacked<Bool>
        public var format: String
        public var quality: StringBacked<Int>

        public init(
            autoTagging: AutoTag,
            autoWriteClipboard: Bool,
            useRetina: Bool,
            shortcutsEnable: Bool,
            format: String,
            quality: Int
        ) {
            self.autoTagging = autoTagging
            self.autoWriteClipboard = StringBacked(autoWriteClipboard)
            self.useRetina = StringBacked(useRetina)
            self.shortcutsEnable = StringBacked(shortcutsEnable)
            self.format = format
            self.quality = StringBacked(quality)
        }
    }
}

// MARK: Self.AutoTag
public extension EagleAppInfo.Preferences.ScreenCapture {
    struct AutoTag: Codable, Equatable, Sendable {
        public var enable: StringBacked<Bool>?

        public init(enable: Bool = false) {
            self.enable = StringBacked(enable)
        }
    }
}
