//
//  EaglePlatform.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public enum EaglePlatform: String, CaseIterable {
    case windows = "win32"
    case macOS = "darwin"
}

// MARK: Self: Codable
extension EaglePlatform: Codable {}

// MARK: Self: Equatable
extension EaglePlatform: Equatable {}

// MARK: Self: Sendable
extension EaglePlatform: Sendable {}
