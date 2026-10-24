//
//  UpdateTags.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct UpdateTags {
    /// Original tag name
    var originalName: String
    /// New tag name
    var name: String
}

// MARK: Self.Output
public extension UpdateTags {
    typealias Output = EagleTag
}

// MARK: Self: Codable
extension UpdateTags: Codable {}

// MARK: Self: Equatable
extension UpdateTags: Equatable {}

// MARK: Self: Sendable
extension UpdateTags: Sendable {}
