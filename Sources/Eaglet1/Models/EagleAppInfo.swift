//
//  EagleAppInfo.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure containing all of the information about the running instance of the Eagle app.
/// 
/// This version of the API also provides all of the preferences defined by the user.
public struct EagleAppInfo: Codable {
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
    public let showCollectModal: Bool
    /// Operating system.
    public let platform: Platform
    /// Preferences of the app.
    public let preferences: Preferences
}

// MARK: EagleAppInfo.Preferences
public extension EagleAppInfo {
    struct Preferences: Codable {
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

// MARK: EagleAppInfo.Preferences.General
public extension EagleAppInfo.Preferences {
    struct General: Codable {
        public var zoom: String //Int
        public var language: String
        public var showMenuItem: String //Bool
        public var showSidebarBadge: String //Bool
        public var autoSelect: String //Bool
        public var showCollectModal: String //Bool
        public var showCaptureCollectModal: String //Bool
        public var IPTC: String //Bool
        public var enableGPU: String //Bool
        public var enableVibrancy: String //Bool
    }
}

// MARK: EagleAppInfo.Preferences.Habits
public extension EagleAppInfo.Preferences {
    struct Habits: Codable {
        public var dblclickSidebarItem: String
        public var scrollBehavior: String
        public var videoScrollBehavior: String
        public var hoverZoom: String
        public var scrollBehaviorTour: Bool
        public var renderBehavior: String
        public var defaultMode: String
        public var rememberLastZoom: String
        public var defaultRatio: String
        public var transparency: String
        public var keyspace: String
        public var middleBtn: String
        public var doubleclick: String
        public var gifViewer: String
        public var alwaysPlayGIF: String
        public var alwaysShowAnnotations: String
    }
}

// MARK: EagleAppInfo.Preferences.Shortcuts
public extension EagleAppInfo.Preferences {
    struct Shortcuts: Codable {
        public var keybinds: [String: String]
    }
}

// MARK: EagleAppInfo.Preferences.Notification
public extension EagleAppInfo.Preferences {
    struct Notification: Codable {
        public var soundEffect: Setting
        public var notification: Setting
    }
}

public extension EagleAppInfo.Preferences.Notification {
    struct Setting: Codable {
        public var enable: String? //Bool?
        public var when: [String: String] //[String: Bool]
    }
}

// MARK: EagleAppInfo.Preferences.Sidebar
public extension EagleAppInfo.Preferences {
    struct Sidebar: Codable {
        public var untagged: String //Bool
        public var unfiled: String //Bool
        public var recent: String //Bool
        public var random: String //Bool
        public var community2: String //Bool
        public var quickAccess: String //Bool
        public var smartFolder: String //Bool
        public var folder: String //Bool
    }
}

// MARK: EagleAppInfo.Preferences.ScreenCapture
public extension EagleAppInfo.Preferences {
    struct ScreenCapture: Codable {
        public var autoTagging: AutoTag
        public var autoWriteClipboard: String //Bool
        public var useRetina: String //Bool
        public var shortcutsEnable: String //Bool
        public var format: String
        public var quality: String //Int

        public struct AutoTag: Codable, Equatable {
            public var enable: String? //Bool?

            public init(enable: String? = nil) {
                self.enable = enable
            }
        }
    }
}

// MARK: EagleAppInfo.Preferences.Video
public extension EagleAppInfo.Preferences {
    struct Video: Codable {
        public var hoverPlay: String //Bool
        public var zoomFill: String //Bool
        public var autoPlay: String //Bool
        public var rememberPosition: String //Bool
        public var loopShortVideo: String //Bool
    }
}

// MARK: EagleAppInfo.Preferences.Font
public extension EagleAppInfo.Preferences {
    struct Font: Codable {
        public var autoTag: String //Bool
    }
}

// MARK: EagleAppInfo.Preferences.Proxy
public extension EagleAppInfo.Preferences {
    struct Proxy: Codable {
        public var enable: String //Bool
        public var ip: String
        public var port: Int
    }
}
// MARK: EagleAppInfo.Preferences.Privacy
public extension EagleAppInfo.Preferences {
    struct Privacy: Codable {
        public var enable: String //Bool
        public var password: String
        public var passwordTips: String
    }
}

// MARK: EagleAppInfo.Preferences.AutoImport
public extension EagleAppInfo.Preferences {
    struct AutoImport: Codable {
        public var enable: String //Bool
        public var path: String
    }
}
// MARK: EagleAppInfo.Preferences.Developer
public extension EagleAppInfo.Preferences {
    struct Developer: Codable {
        public var apiToken: String
    }
}
// MARK: EagleAppInfo.Preferences.Download
public extension EagleAppInfo.Preferences {
    struct Download: Codable {
        public var queueLength: Int
    }
}
// MARK: EagleAppInfo.Preferences.Filters
public extension EagleAppInfo.Preferences {
    struct Filters: Codable {
        public var color: String //Bool
        public var tags: String //Bool
        public var folders: String //Bool
        public var shape: String //Bool
        public var rating: String //Bool
        public var type: String //Bool
        public var date: String //Bool
        public var mtime: String //Bool
        public var resolution: String //Bool
        public var fileSize: String //Bool
        public var comments: String //Bool
        public var annotation: String //Bool
        public var url: String //Bool
        public var camera: String //Bool
        public var duration: String //Bool
        public var bpm: String //Bool
        public var fontActivated: String //Bool
    }
}
