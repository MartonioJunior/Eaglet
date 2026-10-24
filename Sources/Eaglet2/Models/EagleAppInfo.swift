//
//  EagleAppInfo.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
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
    public let buildVersion: String?
    /// Operating system.
    public let platform: Platform
}
