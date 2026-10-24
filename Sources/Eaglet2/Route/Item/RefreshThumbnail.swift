//
//  RefreshThumbnail.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct RefreshThumbnail {
    /// Item ID
    var itemId: EagleID
}

// MARK: Self: Codable
extension RefreshThumbnail: Codable {}

// MARK: Self: Equatable
extension RefreshThumbnail: Equatable {}

// MARK: Self: Sendable
extension RefreshThumbnail: Sendable {}
