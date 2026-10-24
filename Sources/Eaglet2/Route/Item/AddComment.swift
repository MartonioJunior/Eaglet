//
//  AddComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AddComment {
    /// Item ID
    public var id: EagleID
    public var annotation: String
    public var x: Double
    public var y: Double
    public var width: UInt
    public var height: UInt
    public var duration: UInt
}

// MARK: Self: Codable
extension AddComment: Codable {}

// MARK: Self: Equatable
extension AddComment: Equatable {}

// MARK: Self: Sendable
extension AddComment: Sendable {}
