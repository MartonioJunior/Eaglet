//
//  EagleComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct EagleComment {
    public let id: EagleID
    public let x: Double
    public let y: Double
    public let width: UInt
    public let height: UInt
    public let duration: UInt?
    public let annotation: String
    public let lastModified: UInt
}

// MARK: Self: Codable
extension EagleComment: Codable {}

// MARK: Self: Equatable
extension EagleComment: Equatable {}

// MARK: Self: Sendable
extension EagleComment: Sendable {}
