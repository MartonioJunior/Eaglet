//
//  EagleColor.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

/// Type representing a color in a string-based representation.
public enum EagleColor: String, CaseIterable {
    case red
    case orange
    case green
    case yellow
    case aqua
    case blue
    case purple
    case pink
}

// MARK: Self: Decodable
extension EagleColor: Decodable {}

// MARK: Self: Encodable
extension EagleColor: Encodable {}

// MARK: Self: Equatable
extension EagleColor: Equatable {}

// MARK: Self: Sendable
extension EagleColor: Sendable {}