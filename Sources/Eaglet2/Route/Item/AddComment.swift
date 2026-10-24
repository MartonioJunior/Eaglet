//
//  AddComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AddComment {
    /// Item ID
    var id: EagleID
    var annotation: String
    var x: Double
    var y: Double
    var width: UInt
    var height: UInt
    var duration: UInt
}

// MARK: Self: Codable
extension AddComment: Codable {}

// MARK: Self: Equatable
extension AddComment: Equatable {}

// MARK: Self: Sendable
extension AddComment: Sendable {}
