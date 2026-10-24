//
//  RemoveComment.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct RemoveComment {
    var id: EagleID
    var commentID: EagleID
}

// MARK: Self.Output
public extension RemoveComment {
    typealias Output = Bool
}

// MARK: Self: Codable
extension RemoveComment: Codable {}

// MARK: Self: Equatable
extension RemoveComment: Equatable {}

// MARK: Self: Sendable
extension RemoveComment: Sendable {}
