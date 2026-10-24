//
//  UpdateComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct UpdateComment {
    var id: EagleID
    var commentID: EagleID
    var annotation: String
    var x: Double
    var y: Double
    var width: UInt
    var height: UInt
    var duration: UInt
}

// MARK: Self.Output
public extension UpdateComment {
    typealias Output = EagleComment
}

// MARK: Self: Codable
extension UpdateComment: Codable {}

// MARK: Self: Equatable
extension UpdateComment: Equatable {}

// MARK: Self: Sendable
extension UpdateComment: Sendable {}
