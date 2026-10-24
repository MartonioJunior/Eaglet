//
//  UpdateComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct UpdateComment {
    public var id: EagleID
    public var commentID: EagleID
    public var annotation: String?
    public var x: Double?
    public var y: Double?
    public var width: UInt?
    public var height: UInt?
    public var duration: UInt?
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
