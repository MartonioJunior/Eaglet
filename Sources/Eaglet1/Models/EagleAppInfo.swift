//
//  EagleAppInfo.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

import EagletCore

/// Data structure containing all of the information about the running instance of the Eagle app.
/// 
/// This version of the API also provides all of the preferences defined by the user.
public struct EagleAppInfo: Codable, Equatable, Sendable {
    /// Type representing the operating system Eagle is running on.
    public typealias Platform = String
    /// Type representing the version of Eagle running.
    public typealias Version = String
    // MARK: Variables
    /// Eagle version number.
    public let version: Version
    /// Pre-release version identifier.
    /// 
    /// Returns `nil` for stable releases.
    public let prereleaseVersion: String?
    /// Build version identifier.
    public let buildVersion: String
    /// Should Eagle show the collection modal?
    public let showCollectModal: Bool
    /// Operating system.
    public let platform: Platform
    /// Preferences of the app.
    public let preferences: Preferences
}

// MARK: EagleAppInfo.Preferences
public extension EagleAppInfo {
    struct Preferences: Codable, Equatable, Sendable {
        public var general: General
        public var habits: Habits
        public var shortcuts: Shortcuts
        public var theme: String
        public var notification: Notification
        public var sidebar: Sidebar
        public var screencapture: ScreenCapture
        public var video: Video
        public var font: Font
        public var proxy: Proxy
        public var privacy: Privacy
        public var autoImport: AutoImport
        public var developer: Developer
        public var download: Download
        public var filter: Filters
        public var showSubfolderContent: Bool
        public var useRetina: Bool
        public var language: String
    }
}
