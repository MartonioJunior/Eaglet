//
//  EagleComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct EagleComment {
    var id: EagleID
    var x: Double
    var y: Double
    var width: UInt
    var height: UInt
    var duration: UInt?
    var annotation: String
    var lastModified: UInt
}

// MARK: Self: Codable
extension EagleComment: Codable {}

// MARK: Self: Equatable
extension EagleComment: Equatable {}

// MARK: Self: Sendable
extension EagleComment: Sendable {}
